using Infrastructure.Domain.Repositories;
using Infrastructure.Linq.Extensions;
using Senparc.Weixin.MP;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
namespace Application.Wechats.AutoReplys
{
    public class AutoReplyManager : ApplicationDomainServiceBase
    {
        public IRepository<AutoReply> AutoReplyRepository { get; set; }

        public List<AutoReply> GetAutoReplysOfRequestMsgType(int tenantId,RequestType requestType,string key=null)
        {
            using (CurrentUnitOfWork.SetTenantId(tenantId))
            {
                return AutoReplyRepository.GetAll().Include(model=>model.Articles)
                    .Where(model => model.RequestType == requestType)
                    .WhereIf(key!=null,model=> (model.Key==null)||(model.MatchingType == MatchingType.Exact && model.Key == key)||(model.MatchingType == MatchingType.Fuzzy && key.Contains(model.Key)))
                    .OrderBy(model => model.Sort).ToList();
            }
        }
    }
}
