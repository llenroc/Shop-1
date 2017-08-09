using Application.AreaAgents.AreaAgencyApplys;
using Application.AreaAgents.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using System.Threading.Tasks;

namespace Application.AreaAgents.End
{
    public class AreaAgencyApplyForEndAppService : CrudAppService<AreaAgencyApply, AreaAgencyApplyDto>, 
        IAreaAgencyApplyForEndAppService
    {
        public AreaAgencyApplyManager AreaAgencyApplyManager { get; set; }

        public AreaAgencyApplyForEndAppService(IRepository<AreaAgencyApply> respository) :base(respository)
        {

        }

        public async Task PassAreaAgencyApply(IdInput input)
        {
            AreaAgencyApply areaAgencyApply =await Repository.GetAsync(input.Id);
            AreaAgencyApplyManager.PassAreaAgencyApply(areaAgencyApply);
        }

        public void DeleteAreaAgencyApply(IdInput input)
        {
            AreaAgencyApplyManager.DeleteAreaAgencyApplyById(input.Id);
        }
    }
}
