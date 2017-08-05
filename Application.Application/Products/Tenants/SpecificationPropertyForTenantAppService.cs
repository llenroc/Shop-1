using Application.Products.Tenants.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Products.Tenants
{
    public class SpecificationPropertyForTenantAppService : 
        CrudAppService<SpecificationProperty, SpecificationPropertyDto>, 
        ISpecificationPropertyForTenantAppService
    {
        public SpecificationPropertyForTenantAppService(IRepository<SpecificationProperty> respository) :base(respository)
        {
        }

        public SpecificationPropertyCreateOrEditDto GetSpecificationPropertyForCreateOrEdit(NullableIdDto input)
        {
            SpecificationPropertyCreateOrEditDto specificationProperty = new SpecificationPropertyCreateOrEditDto();

            if (input.Id.HasValue)
            {
                specificationProperty = Repository.Get(input.Id.Value).MapTo<SpecificationPropertyCreateOrEditDto>();
            }
            return specificationProperty;
        }

        public SpecificationPropertyCreateOrEditDto CreateOrEdit(SpecificationPropertyCreateOrEditDto input)
        {
            if (input.Id.HasValue)
            {
                CheckUpdatePermission();

                var entity = GetEntityById(input.Id.Value);
                ObjectMapper.Map(input, entity);
                CurrentUnitOfWork.SaveChanges();

                return entity.MapTo<SpecificationPropertyCreateOrEditDto>();
            }
            else
            {
                CheckCreatePermission();

                var entity = input.MapTo<SpecificationProperty>();

                Repository.Insert(entity);
                CurrentUnitOfWork.SaveChanges();

                return entity.MapTo<SpecificationPropertyCreateOrEditDto>();
            }
        }
    }
}
