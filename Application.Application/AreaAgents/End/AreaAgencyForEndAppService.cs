using Application.AreaAgents.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using Infrastructure.Linq.Extensions;
using System.Collections.Generic;
using System.Linq;

namespace Application.AreaAgents.End
{
    public class AreaAgencyForEndAppService : 
        CrudAppService<AreaAgency, AreaAgencyDto,int, AreaAgencyGetAllInput>,
        IAreaAgencyForEndAppService
    {
        public AreaAgencyManager AreaAgencyManager { get; set; }
        public IRepository<AreaAgencyArea> AreaAgencyAreaRespository { get; set; }
        public IRepository<AreaAgent> AreaAgentRespository { get; set; }

        public AreaAgencyForEndAppService(IRepository<AreaAgency> respository) :base(respository)
        {

        }


        protected override IQueryable<AreaAgency> CreateFilteredQuery(AreaAgencyGetAllInput input)
        {
            return Repository.GetAll()
                .WhereIf(input.AreaAgentId.HasValue, model => model.AreaAgentId == input.AreaAgentId)
                .WhereIf(string.IsNullOrEmpty(input.FullName) == false, model => model.User.UserDetail.FullName == input.FullName)
                .WhereIf(string.IsNullOrEmpty(input.PhoneNumber) == false, model => model.User.UserDetail.PhoneNumber == input.PhoneNumber)
                .WhereIf(string.IsNullOrEmpty(input.WechatName) == false, model => model.User.UserDetail.WechatName == input.WechatName)
                .WhereIf(string.IsNullOrEmpty(input.IdentityNumber) == false, model => model.User.UserDetail.IdentityNumber == input.IdentityNumber);
        }

        public ListResultDto<AreaAgencyAreaDto> GetAreaAgencyAreas(IdInput input)
        {
            var list = AreaAgencyAreaRespository.GetAll().Where(model => model.AreaAgencyId == input.Id).ToList().MapTo<List<AreaAgencyAreaDto>>();
            return new ListResultDto<AreaAgencyAreaDto>(list);
        }

        public void DeleteAreaAgency(IdInput input)
        {
            AreaAgencyManager.DeleteAreaAgency(input.Id);
        }

        public void DeleteAreaAgencyAreas(IdInput input)
        {
            AreaAgencyAreaRespository.Delete(input.Id);
        }

        public AreaAgencyAreaMapOutput GetAreaAgencyMap()
        {
            List<AreaAgent> areaAgents = AreaAgentRespository.GetAll().ToList();
            AreaAgencyAreaMapOutput output = new AreaAgencyAreaMapOutput()
            {
                AreaAgencyAreaMapGroups= new List<AreaAgencyAreaMapDto>()
            };

            foreach (AreaAgent areaAgent in areaAgents)
            {
                AreaAgencyAreaMapDto areaAgencyAreaMapDto = new AreaAgencyAreaMapDto()
                {
                    AreaAgentName = areaAgent.Name
                };
                var query = from areaAgencyArea in AreaAgencyAreaRespository.GetAll().Where(model=>model.AreaAgentId== areaAgent.Id)
                            group areaAgencyArea by areaAgencyArea.ProvinceName
                            into areaAgencyAreaGroup
                            select new AreaAgencyAreaMap()
                            {
                                Count = areaAgencyAreaGroup.Count(),
                                ProvinceName = areaAgencyAreaGroup.Key
                            };
                areaAgencyAreaMapDto.AreaAgencyAreaMaps = query.ToList();
                output.AreaAgencyAreaMapGroups.Add(areaAgencyAreaMapDto);
            }
            return output;
        }
    }
}
