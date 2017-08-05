using Application.Wechats.PublicWechats.Dto;
using Infrastructure.Application.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wechats.PublicWechats
{
    public interface IPublicWechatSettingsAppService : IApplicationService
    {
        Task<SettingsEditDto> GetSettings();

        Task UpdateSettings(SettingsEditDto input);
    }
}
