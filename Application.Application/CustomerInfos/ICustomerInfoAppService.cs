using Application.CustomerInfos.Dto;
using Infrastructure.Application.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.CustomerInfos
{
    public interface ICustomerInfoAppService: ICrudAppService<CustomerInfoDto>
    {
        CustomerInfoCreateOrEditOutput GetCustomerInfoForCreateOrEdit(CustomerInfoCreateOrEditInput input);

        CustomerInfoDto SetAsDefault(CustomerInfoGetInput input);

        CustomerInfoDto CreateOrEdit(CustomerInfoCreateOrEditInput input);
    }
}
