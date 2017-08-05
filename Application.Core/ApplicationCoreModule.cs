using Application.Authorization;
using Application.Authorization.Roles;
using Application.Authorization.Users;
using Application.BackgroundWorker;
using Application.Configuration;
using Application.Features;
using Application.MultiTenancy;
using Application.Notifications;
using Application.Orders.Notifications;
using Application.Runtime.Session;
using Infrastructure.AutoMapper;
using Infrastructure.CommonFrame;
using Infrastructure.CommonFrame.Configuration;
using Infrastructure.Configuration.Startup;
using Infrastructure.Localization.Dictionaries;
using Infrastructure.Localization.Dictionaries.Xml;
using Infrastructure.Modules;
using Infrastructure.Runtime.Session;
using Infrastructure.Threading.BackgroundWorkers;
using System.Reflection;

namespace Application.Core
{
    [DependsOn(typeof(CommonFrameCoreModule), typeof(AutoMapperModule))]
    public class ApplicationCoreModule:InfrastructureModule
    {
        public override void PreInitialize()
        {
            Configuration.Auditing.IsEnabledForAnonymousUsers = true;

            //Declare entity types
            Configuration.Modules.CommonFrame().EntityTypes.Tenant = typeof(Tenant);
            Configuration.Modules.CommonFrame().EntityTypes.Role = typeof(Role);
            Configuration.Modules.CommonFrame().EntityTypes.User = typeof(User);

            //Adding notification providers
            Configuration.Notifications.Providers.Add<AppNotificationProvider>();
            Configuration.Notifications.Providers.Add<OrderNotificationProvider>();

            //Remove the following line to disable multi-tenancy.
            Configuration.MultiTenancy.IsEnabled = true;

            //Add/remove localization sources here
            Configuration.Localization.Sources.Add(
                new DictionaryBasedLocalizationSource(
                    ApplicationConsts.LocalizationSourceName,
                    new XmlEmbeddedFileLocalizationDictionaryProvider(
                        Assembly.GetExecutingAssembly(),
                        "Application.Localization.Source"
                        )
                    )
                );

            AppRoleConfig.Configure(Configuration.Modules.CommonFrame().RoleManagement);
            Configuration.Authorization.Providers.Add<ApplicationAuthorizationProvider>();
            Configuration.ReplaceService<IInfrastructureSession, ApplicationSession>();

            //Adding feature providers
            Configuration.Features.Providers.Add<AppFeatureProvider>();

            Configuration.Settings.Providers.Add<AppSettingProvider>();
            Configuration.Settings.Providers.Add<ShopSettingProvider>();
            Configuration.Settings.Providers.Add<WechatSettingProvider>();
            Configuration.Settings.Providers.Add<SpreadSettingProvider>();
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(Assembly.GetExecutingAssembly());
        }

        public override void PostInitialize()
        {
            base.PostInitialize();
            var workManager = IocManager.Resolve<IBackgroundWorkerManager>();

            workManager.Add(IocManager.Resolve<MakeOvertimeProductOrdersDeletedBackgroundWorker>());
            workManager.Add(IocManager.Resolve<WithdrawFailedWithdrawBackgroundWorker>());
        }
    }
}
