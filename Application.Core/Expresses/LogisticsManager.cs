using Application.Orders;
using Infrastructure.Domain.Repositories;
using Utility.Net;

namespace Application.Expresses
{
    public class LogisticsManager: ApplicationDomainServiceBase
    {
        public IRepository<ExpressCompany> ExpressCompanyRepository { get; set; }
        public const string urlFomat="http://api.ickd.cn/?id={0}&secret={1}&com={2}&nu={3}&type=json&encode=utf8&ord=DESC";

        public string GetExpressLogisticss(ExpressInfo expressInfo)
        {
            string appID = "106075";
            string appSecret = "adbbc25423378c43e175fe44247a1077";
            ExpressCompany expressCompany = ExpressCompanyRepository.Get(expressInfo.ExpressCompanyId);

            string url = string.Format(urlFomat, appID, appSecret, expressCompany.Code, expressInfo.TrackingNumber);
            WebRequestHelper webRequestHelper = new WebRequestHelper();
            string result=webRequestHelper.HttpGet(url);
            return result;
        }
    }
}
