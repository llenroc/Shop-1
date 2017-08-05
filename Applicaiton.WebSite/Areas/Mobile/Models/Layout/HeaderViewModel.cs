using Application.Configuration.Host.Dto;
using Application.Sessions.Dto;
using Application.Wechats.PublicWechats.Dto;

namespace Application.WebSite.Areas.Mobile.Models.Layout
{
    public class HeaderViewModel
    {
        public CurrentLoginInformationsOutput CurrentLoginInformations { get; set; }

        public GeneralSettingsDto GeneralSettingsDto { get; set; }

        public AppSettingsOutput AppSettings { get; set; }
    }
}