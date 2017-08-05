using Application.Api;
using Application.EntityFramework;
using Infrastructure.CommonFrame.Configuration;
using Infrastructure.Configuration.Startup;
using Infrastructure.Modules;
using Infrastructure.Web.Mvc;
using System.Reflection;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Infrastructure.Web.SignalR;
using System.Web;
using Infrastructure.IO;
using Application.WebSite.Filters;
using Castle.MicroKernel.Registration;
using Microsoft.Owin.Security;
using Application.WebSite.Navigations.Manager;
using Application.WebSite.Navigations.Home;
using Application.WebSite.Navigations.Mobile;
using Application.Web;
//using Infrastructure.Hangfire;

namespace Application.WebSite
{
    [DependsOn(
       typeof(ApplicationDataModule),
       typeof(ApplicationApplicationModule),
       typeof(ApplicationWebApiModule),
       typeof(WebSignalRModule),
       //typeof(HangfireModule), // ENABLE TO USE HANGFIRE INSTEAD OF DEFAULT JOB MANAGER
       typeof(WebMvcModule))]
    public class WebModule : InfrastructureModule
    {
        public override void PreInitialize()
        {
            //Enable database based localization
            Configuration.Modules.CommonFrame().LanguageManagement.EnableDbLocalization();

            //Configure navigation/menu
            Configuration.Navigation.Providers.Add<ManagerNavigationProvider>();
            Configuration.Navigation.Providers.Add<HomeNavigationProvider>();
            Configuration.Navigation.Providers.Add<MobileFooterNavigationProvider>();
            Configuration.Navigation.Providers.Add<MobileUserCenterNavigationProvider>();

            //Configuration.Modules.WebCommon().MultiTenancy.DomainFormat = WebUrlService.WebSiteRootAddress;

            Configuration.Modules.Web().AntiForgery.IsEnabled = false;
            //Configuration.Modules.Mvc().IsValidationEnabledForControllers = false;

            //Uncomment these lines to use HangFire as background job manager.
            //Configuration.BackgroundJobs.UseHangfire(configuration =>
            //{
            //    configuration.GlobalConfiguration.UseSqlServerStorage("Default");
            //});

            //Uncomment this line to use Redis cache instead of in-memory cache.
            //Configuration.Caching.UseRedis();
        }

        public override void Initialize()
        {
            //Dependency Injection
            IocManager.RegisterAssemblyByConvention(Assembly.GetExecutingAssembly());
            IocManager.IocContainer.Register(Component
                .For<IAuthenticationManager>()
                .UsingFactoryMethod(() => HttpContext.Current.GetOwinContext().Authentication)
                .LifestyleTransient()
                );

            //Areas
            AreaRegistration.RegisterAllAreas();

            //FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);

            //Routes
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            //Bundling
            BundleTable.Bundles.IgnoreList.Clear();
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        public override void PostInitialize()
        {
            GlobalFilters.Filters.Add(IocManager.Resolve<WebMvcAuthorizeFilter>());

            var server = HttpContext.Current.Server;
            var appFolders = IocManager.Resolve<AppFolders>();

            appFolders.SampleProfileImagesFolder = server.MapPath("~/Content/Images/SampleProfilePics/");
            appFolders.TempFileDownloadFolder = server.MapPath("~/Temp/Downloads/");
            appFolders.WebLogsFolder = server.MapPath("~/App_Data/Logs/");
            appFolders.UserResourceFolderBase = "/UserResource/";
            appFolders.UploadFolder = "/Upload/";

            try {
                DirectoryHelper.CreateIfNotExists(appFolders.TempFileDownloadFolder);
                DirectoryHelper.CreateIfNotExists(server.MapPath("~" + appFolders.UserResourceFolderBase));
                DirectoryHelper.CreateIfNotExists(server.MapPath("~" + appFolders.UploadFolder));
            }
            catch {

            }
        }
    }
}
