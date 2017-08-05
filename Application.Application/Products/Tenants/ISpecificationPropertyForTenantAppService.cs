using Application.Products.Tenants.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Products.Tenants
{
    public interface ISpecificationPropertyForTenantAppService : ICrudAppService<SpecificationPropertyDto>
    {
        SpecificationPropertyCreateOrEditDto GetSpecificationPropertyForCreateOrEdit(NullableIdDto input);

        SpecificationPropertyCreateOrEditDto CreateOrEdit(SpecificationPropertyCreateOrEditDto input);
    }
}
