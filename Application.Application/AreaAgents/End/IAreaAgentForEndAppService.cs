using Application.AreaAgents.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;

namespace Application.AreaAgents.End
{
    public interface IAreaAgentForEndAppService: ICrudAppService<AreaAgentDto>
    {
        AreaAgentForCreateOrEditOutput GetAreaAgentForCreateOrEdit(NullableIdDto input);

        AreaAgentForCreateOrEditDto CreateOrEdit(AreaAgentCreateOrEditInput input);

        void RemoveDistribution(IdInput input);
    }
}
