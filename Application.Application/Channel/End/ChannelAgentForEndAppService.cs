using Application.Channel.ChannelAgents;
using Application.Channel.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Collections.Generic;
using System.Linq;

namespace Application.Channel.End
{
    public class ChannelAgentForEndAppService : CrudAppService<ChannelAgent, ChannelAgentDto>, IChannelAgentForEndAppService
    {
        public IRepository<ChannelAgentDistribution> ChannelAgentDistributionRespository { get; set; }
        public IRepository<ChannelAgentAssortment> ChannelAgentAssortmentRespository { get; set; }

        public ChannelAgentForEndAppService(IRepository<ChannelAgent> respository) :base(respository)
        {

        }

        public override ListResultDto<ChannelAgentDto> GetAll()
        {
            CheckGetAllPermission();
            var entities = Repository.GetAll().OrderBy(model=>model.Level).ToList();
            return new ListResultDto<ChannelAgentDto>(entities.Select(MapToEntityDto).ToList());
        }


        public ChannelAgentForCreateOrEditOutput GetChannelAgentForCreateOrEdit(NullableIdDto input)
        {
            ChannelAgentForCreateOrEditOutput channelAgentForCreateOrEditOutput = new ChannelAgentForCreateOrEditOutput()
            {
                ChannelAgent= new ChannelAgentForCreateOrEditDto()
            };

            if (input.Id.HasValue)
            {
                channelAgentForCreateOrEditOutput.ChannelAgent = Repository.Get(input.Id.Value).MapTo<ChannelAgentForCreateOrEditDto>();
                channelAgentForCreateOrEditOutput.ChannelAgentDistributions= ChannelAgentDistributionRespository.GetAll()
                    .Where(model => model.ChannelAgentId == input.Id.Value).ToList()
                    .Select(entity => ObjectMapper.Map<ChannelAgentDistributionDto>(entity)).ToList();
                channelAgentForCreateOrEditOutput.ChannelAgentAssortments = ChannelAgentAssortmentRespository.GetAll()
                  .Where(model => model.ChannelAgentId == input.Id.Value).ToList()
                  .Select(entity => ObjectMapper.Map<ChannelAgentAssortmentDto>(entity)).ToList();
            }
            return channelAgentForCreateOrEditOutput;
        }


        public ChannelAgentForCreateOrEditDto CreateOrEdit(ChannelAgentCreateOrEditInput input)
        {
            if (input.ChannelAgent.Id.HasValue)
            {
                CheckUpdatePermission();

                var entity = GetEntityById(input.ChannelAgent.Id.Value);
                ObjectMapper.Map(input.ChannelAgent, entity);
                CurrentUnitOfWork.SaveChanges();
                SetDistributions(entity, input.ChannelAgentDistributions);
                SetChannelAgentAssortments(entity, input.ChannelAgentAssortments);
                return entity.MapTo<ChannelAgentForCreateOrEditDto>();
            }
            else
            {
                CheckCreatePermission();
                var entity = input.ChannelAgent.MapTo<ChannelAgent>();

                Repository.Insert(entity);
                CurrentUnitOfWork.SaveChanges();
                SetDistributions(entity, input.ChannelAgentDistributions);
                SetChannelAgentAssortments(entity, input.ChannelAgentAssortments);
                return entity.MapTo<ChannelAgentForCreateOrEditDto>();
            }
        }

        private void SetDistributions(ChannelAgent channelAgent, List<ChannelAgentDistributionCreateOrEditInput> distributions)
        {
            if (distributions == null)
            {
                return;
            }

            foreach (var distribution in distributions)
            {
                if (distribution.Id.HasValue)
                {
                    var entity = ChannelAgentDistributionRespository.Get(distribution.Id.Value);
                    ObjectMapper.Map(distribution, entity);
                    CurrentUnitOfWork.SaveChanges();
                }
                else
                {
                    var entity = distribution.MapTo<ChannelAgentDistribution>();
                    entity.ChannelAgentId = channelAgent.Id;
                    ChannelAgentDistributionRespository.Insert(entity);
                    CurrentUnitOfWork.SaveChanges();
                }
            }
        }

        private void SetChannelAgentAssortments(ChannelAgent channelAgent, List<ChannelAgentAssortmentCreateOrEditInput> channelAgentAssortments)
        {
            if (channelAgentAssortments == null)
            {
                return;
            }

            foreach (var channelAgentAssortment in channelAgentAssortments)
            {
                if (channelAgentAssortment.Id.HasValue)
                {
                    var entity = ChannelAgentAssortmentRespository.Get(channelAgentAssortment.Id.Value);
                    ObjectMapper.Map(channelAgentAssortment, entity);
                    CurrentUnitOfWork.SaveChanges();
                }
                else
                {
                    var entity = channelAgentAssortment.MapTo<ChannelAgentAssortment>();
                    entity.ChannelAgentId = channelAgent.Id;
                    ChannelAgentAssortmentRespository.Insert(entity);
                    CurrentUnitOfWork.SaveChanges();
                }
            }
        }

        public void RemoveDistribution(IdInput input)
        {
            var entity = ChannelAgentDistributionRespository.Get(input.Id);
            ChannelAgentDistributionRespository.Delete(entity);
        }

        public void RemoveChannelAgentDistribution(IdInput input)
        {
            var entity = ChannelAgentAssortmentRespository.Get(input.Id);
            ChannelAgentAssortmentRespository.Delete(entity);
        }
    }
}
