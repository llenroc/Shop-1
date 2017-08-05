using Application.AreaAgents.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Collections.Generic;
using System.Linq;

namespace Application.AreaAgents.End
{
    public class AreaAgentForEndAppService : CrudAppService<AreaAgent, AreaAgentDto>, IAreaAgentForEndAppService
    {
        public IRepository<AreaAgentDistribution> AreaAgentDistributionRespository { get; set; }

        public AreaAgentForEndAppService(IRepository<AreaAgent> respository) :base(respository)
        {

        }

        public AreaAgentForCreateOrEditOutput GetAreaAgentForCreateOrEdit(NullableIdDto input)
        {
            AreaAgentForCreateOrEditOutput areaAgentForCreateOrEditOutput = new AreaAgentForCreateOrEditOutput()
            {
                AreaAgent = new AreaAgentForCreateOrEditDto()
            };

            if (input.Id.HasValue)
            {
                areaAgentForCreateOrEditOutput.AreaAgent = Repository.Get(input.Id.Value).MapTo<AreaAgentForCreateOrEditDto>();
                areaAgentForCreateOrEditOutput.AreaAgentDistributions = AreaAgentDistributionRespository.GetAll()
                    .Where(model => model.AreaAgentId == input.Id.Value).ToList()
                    .Select(entity => ObjectMapper.Map<AreaAgentDistributionDto>(entity)).ToList();
            }
            return areaAgentForCreateOrEditOutput;
        }


        public AreaAgentForCreateOrEditDto CreateOrEdit(AreaAgentCreateOrEditInput input)
        {
            if (input.AreaAgent.Id.HasValue)
            {
                CheckUpdatePermission();

                var entity = GetEntityById(input.AreaAgent.Id.Value);
                ObjectMapper.Map(input.AreaAgent, entity);
                CurrentUnitOfWork.SaveChanges();
                SetDistributions(entity, input.AreaAgentDistributions);
                return entity.MapTo<AreaAgentForCreateOrEditDto>();
            }
            else
            {
                CheckCreatePermission();
                var entity = input.AreaAgent.MapTo<AreaAgent>();
                Repository.Insert(entity);
                CurrentUnitOfWork.SaveChanges();
                SetDistributions(entity, input.AreaAgentDistributions);
                return entity.MapTo<AreaAgentForCreateOrEditDto>();
            }
        }

        private void SetDistributions(AreaAgent areaAgent, List<AreaAgentDistributionCreateOrEditInput> distributions)
        {
            if (distributions == null)
            {
                return;
            }

            foreach (var distribution in distributions)
            {
                if (distribution.Id.HasValue)
                {
                    var entity = AreaAgentDistributionRespository.Get(distribution.Id.Value);
                    ObjectMapper.Map(distribution, entity);
                    CurrentUnitOfWork.SaveChanges();
                }
                else
                {
                    var entity = distribution.MapTo<AreaAgentDistribution>();
                    entity.AreaAgentId = areaAgent.Id;
                    AreaAgentDistributionRespository.Insert(entity);
                    CurrentUnitOfWork.SaveChanges();
                }
            }
        }

        public void RemoveDistribution(IdInput input)
        {
            var entity = AreaAgentDistributionRespository.Get(input.Id);
            AreaAgentDistributionRespository.Delete(entity);
        }
    }
}
