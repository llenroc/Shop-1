using Application.Group.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Group
{
    public interface IGroupAppService: IApplicationService
    {
        PagedResultDto<CustomerDto> GetCustomers(CustomerGetAllInput input);
    }
}
