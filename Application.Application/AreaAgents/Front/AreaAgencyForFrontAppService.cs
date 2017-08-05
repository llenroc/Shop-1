using Application.AreaAgents.AreaAgencyApplys;
using Application.AreaAgents.AreaAgentCertificates;
using Application.AreaAgents.Front.Dto;
using Application.Authorization.Users;
using Application.PictureTemplates;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using Infrastructure.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.AreaAgents.Front
{
    public class AreaAgencyForFrontAppService : ApplicationAppServiceBase, IAreaAgencyForFrontAppService
    {
        public IRepository<PictureTemplate> PictureTemplateRespository { get; set; }
        protected IRepository<AreaAgency> Respository;
        protected IRepository<User, long> UserRespository;
        public AreaAgencyManager AreaAgencyManager { get; set; }
        public AreaAgencyApplyManager AreaAgencyApplyManager { get; set; }
        public IRepository<AreaAgencyArea> AreaAgencyAreaRespository { get; set; }
        public AreaAgentRebateManager AreaAgentRebateManager { get; set; }
        public AreaAgentAreaManager AreaAgentAreaManager { get; set; }
        public AreaAgentCertificateManager AreaAgentCertificateManager { get; set; }

        public AreaAgencyForFrontAppService(IRepository<AreaAgency> respository,
            IRepository<User, long> userRespository)
        {
            Respository = respository;
            UserRespository = userRespository;
        }

        public AreaAgencyGetOutput GetAreaAgency(IdInput input)
        {
            AreaAgencyGetOutput areaAgencyGetOutput = new AreaAgencyGetOutput();
            areaAgencyGetOutput.AreaAgency = Respository.GetAll().Where(model => model.UserId == InfrastructureSession.UserId.Value && model.AreaAgentId == input.Id)
                .FirstOrDefault().MapTo<AreaAgencyDto>();
            areaAgencyGetOutput.CustomerCount= AreaAgentAreaManager.GetCustomerCount(areaAgencyGetOutput.AreaAgency.Id);
            areaAgencyGetOutput.TotalRebate = AreaAgentRebateManager.GetTotalRebateOfAreaAgency(areaAgencyGetOutput.AreaAgency.Id);
            areaAgencyGetOutput.NormalAddressCount = AreaAgencyAreaRespository.GetAll().Where(model => model.AreaAgencyId == areaAgencyGetOutput.AreaAgency.Id && model.Address.DevelopLevel == Regions.DevelopLevel.Normal).Count();
            areaAgencyGetOutput.DevelopedAddressCount = AreaAgencyAreaRespository.GetAll().Where(model => model.AreaAgencyId == areaAgencyGetOutput.AreaAgency.Id && model.Address.DevelopLevel == Regions.DevelopLevel.Developed).Count();
            return areaAgencyGetOutput;
        }

        public PagedResultDto<CustomerInfoDto> GetCustomerInfos(CustomerInfoGetAllInput input)
        {
            PagedResultDto<CustomerInfoDto> output = new PagedResultDto<CustomerInfoDto>();
            output.TotalCount = AreaAgentAreaManager.GetCustomerCount(input.AreaAgencyId);
            var list = AreaAgentAreaManager.GetCustomers(input.AreaAgencyId)
                .OrderBy(model => model.CreationTime).Skip((input.PageIndex-1) * input.PageSize).Take(input.PageSize).ToList().MapTo<List<CustomerInfoDto>>();
            output.Items = list;
            output.PageSize = input.PageSize;
            return output;
        }

        public ListResultDto<AreaAgencyDto> GetMyAreaAgencys()
        {
            var list= Respository.GetAll().Where(model => model.UserId == InfrastructureSession.UserId.Value).ToList()
                .MapTo<List<AreaAgencyDto>>();
            return new ListResultDto<AreaAgencyDto>(list);
        }

        public ListResultDto<AreaAgencyAreaDto> GetAreaAgencyAreas(AreaAgencyAreasGetInput input)
        {
            var list = AreaAgencyAreaRespository.GetAll().Where(model => model.AreaAgencyId == input.AreaAgencyId&&model.DevelopLevel==input.DevelopLevel).ToList().MapTo<List<AreaAgencyAreaDto>>();
            return new ListResultDto<AreaAgencyAreaDto>(list);
        }

        public async Task<string> GetCertificate(IdInput input)
        {
            User user = GetCurrentUser();

            if (!user.IsAreaAgency)
            {
                throw new UserFriendlyException(L("YouAreNoteAreaAgency"));
            }

            try
            {
                AreaAgency areaAgency = AreaAgencyManager.GetAreaAgencyOfUser(input.Id);
                AreaAgentCertificateCreateInput data = new AreaAgentCertificateCreateInput()
                {
                    User = user,
                    AreaAgency = areaAgency
                };

                if (!areaAgency.AreaAgent.PictureTemplateId.HasValue)
                {
                    throw new UserFriendlyException(L("CertificateTemplateHasNotSet"));
                }
                PictureTemplate pictureTemplate = PictureTemplateRespository.Get(areaAgency.AreaAgent.PictureTemplateId.Value);
                return await AreaAgentCertificateManager.CreatePictureAsync(pictureTemplate, data);
            }
            catch(Exception e)
            {
                throw new UserFriendlyException(e.Message,e);
            }
        }

        public async Task<string> ReCreateCertificate(IdInput input)
        {
            User user = GetCurrentUser();

            if (!user.IsAreaAgency)
            {
                throw new UserFriendlyException(L("YouAreNoteAreaAgency"));
            }
            try
            {
                AreaAgency areaAgency = AreaAgencyManager.GetAreaAgencyOfUser(input.Id);
                AreaAgentCertificateCreateInput data = new AreaAgentCertificateCreateInput()
                {
                    User = user,
                    AreaAgency = areaAgency
                };

                if (areaAgency.AreaAgent.PictureTemplateId.HasValue)
                {
                    throw new UserFriendlyException(L("CertificateTemplateHasNotSet"));
                }
                PictureTemplate pictureTemplate = PictureTemplateRespository.Get(areaAgency.AreaAgent.PictureTemplateId.Value);
                return await AreaAgentCertificateManager.ReCreatePictureAsync(pictureTemplate, data);
            }
            catch (Exception e)
            {
                throw new UserFriendlyException(e.Message, e);
            }
        }
    }
}
