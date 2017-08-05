using Application.Configuration;
using Application.Configuration.Host;
using Application.Sessions;
using Application.WebSite.Models.Layout;
using Application.WebSite.Navigations.Home;
using Infrastructure.Application.Navigation;
using Infrastructure.Configuration;
using Infrastructure.Configuration.Startup;
using Infrastructure.Runtime.Session;
using Infrastructure.Threading;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Application.WebSite.Controllers
{
    public class LayoutController : AnonymousHomeControllerBase
    {
        private readonly ISessionAppService _sessionAppService;
        private readonly IUserNavigationManager _userNavigationManager;
        private readonly IMultiTenancyConfig _multiTenancyConfig;
        public IHostSettingsAppService HostSettingsAppService { get; set; }

        public LayoutController(
            ISessionAppService sessionAppService, 
            IUserNavigationManager userNavigationManager, 
            IMultiTenancyConfig multiTenancyConfig)
        {
            _sessionAppService = sessionAppService;
            _userNavigationManager = userNavigationManager;
            _multiTenancyConfig = multiTenancyConfig;
        }


        [ChildActionOnly]
        public PartialViewResult Header(string currentPageName = "")
        {
            var headerModel = new HeaderViewModel();
            headerModel.AppSettings = HostSettingsAppService.GetAppSettings();

            if (InfrastructureSession.UserId.HasValue)
            {
                headerModel.LoginInformations = _sessionAppService.GetCurrentLoginInformations();
            }
            headerModel.Menu = AsyncHelper.RunSync(() => _userNavigationManager.GetMenuAsync(HomeNavigationProvider.MenuName, InfrastructureSession.ToUserIdentifier()));
            headerModel.CurrentPageName = currentPageName;

            headerModel.IsMultiTenancyEnabled = _multiTenancyConfig.IsEnabled;
            headerModel.TenantRegistrationEnabled = SettingManager.GetSettingValue<bool>(AppSettings.TenantManagement.AllowSelfRegistration);

            return PartialView(headerModel);
        }
    }
}