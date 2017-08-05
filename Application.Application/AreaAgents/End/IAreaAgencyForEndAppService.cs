using Application.AreaAgents.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Collections.Generic;

namespace Application.AreaAgents.End
{
    public interface IAreaAgencyForEndAppService : ICrudAppService<AreaAgencyDto,int, AreaAgencyGetAllInput>
    {
        ListResultDto<AreaAgencyAreaDto> GetAreaAgencyAreas(IdInput input);

        void DeleteAreaAgencyAreas(IdInput input);

        AreaAgencyAreaMapOutput GetAreaAgencyMap();
    }
}