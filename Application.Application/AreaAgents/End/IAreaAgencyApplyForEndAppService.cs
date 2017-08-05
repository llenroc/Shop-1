using Application.AreaAgents.End.Dto;
using Application.Channel.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.AreaAgents.End
{
    public interface IAreaAgencyApplyForEndAppService : ICrudAppService<AreaAgencyApplyDto>
    {
        Task PassAreaAgencyApply(IdInput input);
    }
}