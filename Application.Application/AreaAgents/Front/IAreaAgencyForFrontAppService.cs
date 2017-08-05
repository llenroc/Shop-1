using Application.AreaAgents.Front.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.AreaAgents.Front
{
    public interface IAreaAgencyForFrontAppService: IApplicationService
    {
        AreaAgencyGetOutput GetAreaAgency(IdInput input);

        PagedResultDto<CustomerInfoDto> GetCustomerInfos(CustomerInfoGetAllInput input);

        ListResultDto<AreaAgencyDto> GetMyAreaAgencys();

        ListResultDto<AreaAgencyAreaDto> GetAreaAgencyAreas(AreaAgencyAreasGetInput input);

        Task<string> GetCertificate(IdInput input);

        Task<string> ReCreateCertificate(IdInput input);
    }
}
