
using Application.CustomerInfos.Dto;
using Application.Customers;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.CustomerInfos
{
    public class CustomerInfoAppService : CrudAppService<CustomerInfo, CustomerInfoDto>,ICustomerInfoAppService
    {
        public CustomerInfoManager CustomerInfoManager { get; set; }

        public CustomerInfoAppService(
            IRepository<CustomerInfo> respository) 
            :base(respository)
        {

        }

        protected override IQueryable<CustomerInfo> CreateFilteredQuery(PagedAndSortedResultRequestDto input)
        {
            return Repository.GetAll().Where(model=>model.CreatorUserId==InfrastructureSession.UserId.Value);
        }

        public CustomerInfoCreateOrEditOutput GetCustomerInfoForCreateOrEdit(CustomerInfoCreateOrEditInput input)
        {
            CustomerInfoCreateOrEditOutput customerInfo;

            if (input.Id.HasValue)
            {
                customerInfo = Repository.Get(input.Id.Value).MapTo<CustomerInfoCreateOrEditOutput>();
            }
            else
            {
                customerInfo = new CustomerInfoCreateOrEditOutput();
            }
            return customerInfo;
        }

        public CustomerInfoDto SetAsDefault(CustomerInfoGetInput input)
        {
            CustomerInfo customerInfo=CustomerInfoManager.SetAsDefaultCustomerInfo(input.Id, InfrastructureSession.UserId.Value);
            return customerInfo.MapTo<CustomerInfoDto>();
        }

        public CustomerInfoDto CreateOrEdit(CustomerInfoCreateOrEditInput input)
        {
            if (input.Id.HasValue)
            {
                CheckUpdatePermission();

                var entity = GetEntityById(input.Id.Value);
                ObjectMapper.Map(input, entity);

                CustomerInfo defaultCustomerInfo = CustomerInfoManager.GetDefaultCustomerInfo(InfrastructureSession.UserId.Value);

                if (defaultCustomerInfo == null)
                {
                    entity.IsDefault = true;
                }
                CurrentUnitOfWork.SaveChanges();
                return MapToEntityDto(entity);
            }
            else
            {
                CheckCreatePermission();

                var entity = input.MapTo<CustomerInfo>();

                CustomerInfo defaultCustomerInfo = CustomerInfoManager.GetDefaultCustomerInfo(InfrastructureSession.UserId.Value);

                if (defaultCustomerInfo == null)
                {
                    entity.IsDefault = true;
                }
                Repository.Insert(entity);
                CurrentUnitOfWork.SaveChanges();

                return MapToEntityDto(entity);
            }
        }
    }
}
