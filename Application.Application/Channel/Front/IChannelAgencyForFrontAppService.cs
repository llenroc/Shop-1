using Application.Authorization.Front.Dto;
using Application.Channel.Front.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Channel.Front
{
    public interface IChannelAgencyForFrontAppService: IApplicationService
    {
        ChannelAgencyOutput GetChannelAgency();

        MyChannelAgentInfo GetMyChannelAgentInfo();

        PagedResultDto<CommonUserForProfileDto> GetCustomersOfChannelAgency(CustomerGetAllInput input);

        Task<string> GetCertificate();

        Task<string> ReCreateCertificate();
    }
}
