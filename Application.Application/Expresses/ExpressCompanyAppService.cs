using Application.Expresses;
using Application.Expresses.Dto;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;

namespace Application.Products.Tenants
{
    public class ExpressCompanyAppService:CrudAppService<ExpressCompany, ExpressCompanyDto>, IExpressCompanyAppService
    {
        public ExpressCompanyAppService(IRepository<ExpressCompany> respository) :base(respository)
        {
        }
    }
}
