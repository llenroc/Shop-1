using Application.Expresses.Dto;
using Infrastructure.Application.Services;

namespace Application.Products.Tenants
{
    public interface IExpressCompanyAppService: ICrudAppService<ExpressCompanyDto>
    {
    }
}
