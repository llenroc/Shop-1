using Application.Spread;
using Application.Spread.Front.SpreadPosters.Dto;
using Application.Spread.SpreadPosters;
using Application.Spread.SpreadPosters.SpreadPosterTemplates;
using Application.SpreadPosters.Front.Dto;
using Application.Wechats.Qrcodes;
using Infrastructure;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using Infrastructure.Runtime.Session;
using Infrastructure.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.SpreadPosters.Front
{
    public class SpreadPosterAppService: ApplicationAppServiceBase, ISpreadPosterAppService
    {
        private IRepository<SpreadPosterTemplate> SpreadPosterTemplateRespository;
        public SpreadPosterManager SpreadPosterManager { get; set; }
        public SpreadManager SpreadManager { get; set; }
        public QrcodeManager QrcodeManager { get; set; }

        public SpreadPosterAppService(IRepository<SpreadPosterTemplate> spreadPosterTemplateRespository)
        {
            SpreadPosterTemplateRespository = spreadPosterTemplateRespository;
        }


        public async Task<QrcodeDto> GetQrcodeAsync()
        {
            UserIdentifier userIdentifier = new UserIdentifier(InfrastructureSession.TenantId, InfrastructureSession.UserId.Value);
            Qrcode qrcode = await QrcodeManager.GetQrcodeAsync(userIdentifier);
            return qrcode.MapTo<QrcodeDto>();
        }

        public async Task<SpreadPosterOutput> GetSpreadPosters()
        {
            await SpreadManager.CanSpreadAsync(InfrastructureSession.ToUserIdentifier());
            List<SpreadPosterTemplate> spreadPosterTemplates = SpreadPosterTemplateRespository.GetAll().ToList();
            List<SpreadPosterDto> spreadPosterDtos = new List<SpreadPosterDto>();
            SpreadPosterOutput spreadPosterOutput = new SpreadPosterOutput();

            foreach (SpreadPosterTemplate spreadPosterTemplate in spreadPosterTemplates)
            {
                SpreadPosterDto spreadPosterDto = new SpreadPosterDto();
                spreadPosterDto.SpreadPosterTemplate = spreadPosterTemplate.MapTo<SpreadPosterTemplateDto>();
                spreadPosterDto.Path =await SpreadPosterManager.GetSpreadPosterAsync(spreadPosterTemplate.Id, InfrastructureSession.ToUserIdentifier());
                spreadPosterDtos.Add(spreadPosterDto);
            }
            spreadPosterOutput.SpreadPosters = spreadPosterDtos;
            return spreadPosterOutput;
        }

        public async Task<string> GetDefatulSpreadPoster()
        {
            try
            {
                UserIdentifier userIdentifier = new UserIdentifier(InfrastructureSession.TenantId, InfrastructureSession.UserId.Value);
                string path = await SpreadPosterManager.GetDefaultSpreadPosterAsync(userIdentifier);
                return path;
            }
            catch(Exception e)
            {
                throw new UserFriendlyException(e.Message);
            }
           
        }

        public async Task<string> ReCreateDefaultSpreadPoster()
        {
            UserIdentifier userIdentifier = new UserIdentifier(InfrastructureSession.TenantId, InfrastructureSession.UserId.Value);
            string path = await SpreadPosterManager.ReCreateDefaultSpreadPosterAsync(userIdentifier);
            return path;
        }

        public async Task<string> CreateSpreadPoster(IdInput input)
        {
            UserIdentifier userIdentifier = new UserIdentifier(InfrastructureSession.TenantId, InfrastructureSession.UserId.Value);
            string path = await SpreadPosterManager.CreateSpreadPosterAsync(input.Id,userIdentifier);
            return path;
        }
    }
}
