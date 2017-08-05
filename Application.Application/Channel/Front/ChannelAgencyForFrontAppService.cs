using Application.Authorization.Front.Dto;
using Application.Authorization.Users;
using Application.Channel.ChananlAgencys;
using Application.Channel.ChannelAgencies;
using Application.Channel.Front.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using Infrastructure.Collections.Extensions;
using Infrastructure.Domain.Repositories;
using System.Linq;
using Infrastructure.Linq.Extensions;
using Application.Channel.ChannelAgents;
using System.Linq.Dynamic;
using Infrastructure.UI;
using Application.Channel.ChannelAgentCertificate;
using System.Threading.Tasks;
using Application.PictureTemplates;
using Application.Authorization;
using System.Collections.Generic;

namespace Application.Channel.Front
{
    public class ChannelAgencyForFrontAppService : ApplicationAppServiceBase, IChannelAgencyForFrontAppService
    {
        protected IRepository<ChannelAgency> Respository;
        protected IRepository<User, long> UserRespository;
        public IRepository<PictureTemplate> PictureTemplateRespository { get; set; }
        public ChannelAgencyManager ChannelAgencyManager { get; set; }
        public ChannelAgencyApplyManager ChannelAgencyApplyManager { get; set; }
        public ChannelAgentRebateManager ChannelAgentRebateManager { get; set; }
        public ChannelAgentCertificateManager ChannelAgentCertificateManager { get; set; }
        public AuthorizationHelper AuthorizationHelper { get; set; }

        public ChannelAgencyForFrontAppService(IRepository<ChannelAgency> respository,
            IRepository<User, long> userRespository)
        {
            Respository = respository;
            UserRespository = userRespository;
        }

        public ChannelAgencyOutput GetChannelAgency()
        {
            User user = AuthorizationHelper.CurrentUser;

            if (!user.IsChannelAgency)
            {
                throw new UserFriendlyException(L("YouAreNotChannelAgency"));
            }
            ChannelAgencyOutput channelAgencyGetOutput = new ChannelAgencyOutput();
            channelAgencyGetOutput.ChannelAgency = Respository.GetAll().Where(model => model.UserId == InfrastructureSession.UserId.Value)
                .FirstOrDefault().MapTo<ChannelAgencyDto>();
            channelAgencyGetOutput.TotalRebate = ChannelAgentRebateManager.GetTotalRebateOfChannelAgency(channelAgencyGetOutput.ChannelAgency.Id);
            return channelAgencyGetOutput;
        }

        public MyChannelAgentInfo GetMyChannelAgentInfo()
        {
            MyChannelAgentInfo myChannelAgentInfo = new MyChannelAgentInfo()
            {
                ChannelAgency = ChannelAgencyManager.GetChannelAgencyOfUser(InfrastructureSession.UserId.Value).MapTo<ChannelAgencyDto>(),
                ApplyingChannelAgencyApply = ChannelAgencyApplyManager.GetApplyingChannelAgencyApplyOfUser(InfrastructureSession.UserId.Value).MapTo<ChannelAgencyApplyDto>()
            };
            return myChannelAgentInfo;
        }

        public async Task<string> GetCertificate()
        {
            User user = GetCurrentUser();

            if (!user.IsChannelAgency)
            {
                throw new UserFriendlyException(L("YouAreNoteChannelAgency"));
            }
            ChannelAgency channelAgency = ChannelAgencyManager.GetChannelAgencyOfUser(InfrastructureSession.UserId.Value);
            ChannelAgentCertificateCreateInput data = new ChannelAgentCertificateCreateInput()
            {
                User = user,
                ChannelAgency = channelAgency
            };

            if (!channelAgency.ChannelAgent.PictureTemplateId.HasValue)
            {
                throw new UserFriendlyException(L("CertificateTemplateHasNotSet"));
            }
            PictureTemplate pictureTemplate = PictureTemplateRespository.Get(channelAgency.ChannelAgent.PictureTemplateId.Value);
            return await ChannelAgentCertificateManager.CreatePictureAsync(pictureTemplate, data);
        }

        public async Task<string> ReCreateCertificate()
        {
            User user = GetCurrentUser();

            if (!user.IsChannelAgency)
            {
                throw new UserFriendlyException(L("YouAreNoteChannelAgency"));
            }
            ChannelAgency channelAgency = ChannelAgencyManager.GetChannelAgencyOfUser(InfrastructureSession.UserId.Value);
            ChannelAgentCertificateCreateInput data = new ChannelAgentCertificateCreateInput()
            {
                User = user,
                ChannelAgency = channelAgency
            };

            if (!channelAgency.ChannelAgent.PictureTemplateId.HasValue)
            {
                throw new UserFriendlyException(L("CertificateTemplateHasNotSet"));
            }
            PictureTemplate pictureTemplate = PictureTemplateRespository.Get(channelAgency.ChannelAgent.PictureTemplateId.Value);
            return await ChannelAgentCertificateManager.ReCreatePictureAsync(pictureTemplate, data);
        }

        public PagedResultDto<CommonUserForProfileDto> GetCustomersOfChannelAgency(CustomerGetAllInput input)
        {
            User user = GetCurrentUser();
            var query = UserRespository.GetAll().Where( model => model.ChannelAgencyId == user.UserChannelAgencyId)
                .WhereIf(input.Depth.HasValue,model=>model.ChannelAgentDepth==input.Depth.Value)
                .WhereIf(input.ShouldBePotential, model => model.IsSpreader == false);
            var totalCount = query.Count();
            query = query.OrderBy(model => model.CreationTime).PageBy((input.PageIndex - 1) * input.PageSize, input.PageSize);

            var entities = query.ToList();

            return new PagedResultDto<CommonUserForProfileDto>(
                totalCount,
                input.PageIndex,
                input.PageSize,
                entities.MapTo<List<CommonUserForProfileDto>>()
            );
        }
    }
}
