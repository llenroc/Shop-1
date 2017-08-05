using Application.Authorization;
using Infrastructure.Application.Navigation;
using Infrastructure.Localization;

namespace Application.WebSite.Navigations.Manager
{
    public class ManagerNavigationProvider : NavigationProvider
    {
        public const string MenuName = "ManagerMenu"; 

        public override void SetNavigation(INavigationProviderContext context)
        {
            var menu = new MenuDefinition(MenuName, new FixedLocalizableString("Manager Menu"));
            context.Manager.Menus[MenuName] = menu;

            menu.AddItem(
                new MenuItemDefinition(
                    "Manager.SystemManager",
                    new LocalizableString("SystemManager", ApplicationConsts.LocalizationSourceName),
                    icon: "icon-cog").AddItem(
                    //Common
                    new MenuItemDefinition(
                        "Common.User",
                        L("User"),
                        url: "user.index",
                        icon: "icon-group",
                        requiredPermissionName: AppPermissions.PagesAdministrationCommon
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Common.Role",
                        L("Role"),
                        url: "role.index",
                        icon: "icon-key",
                        requiredPermissionName: AppPermissions.PagesAdministrationCommon
                        )
                        )
                        //Host
                        .AddItem(
                    new MenuItemDefinition(
                        "Host.Dashboard",
                        L("Dashboard"),
                        url: "host.dashboard",
                        icon: "icon-globe",
                        requiredPermissionName: AppPermissions.PagesAdministrationHostTenants
                        )
                        )
                        .AddItem(
                    new MenuItemDefinition(
                        "Host.Tenants",
                        L("Tenants"),
                        url: "host.tenant.index",
                        icon: "icon-globe",
                        requiredPermissionName: AppPermissions.PagesAdministrationHostTenants
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Host.Edition",
                        L("Editions"),
                        url: "host.edition",
                        icon: "icon-inbox",
                        requiredPermissionName: AppPermissions.PagesAdministrationHostEditions
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Host.Maintenance",
                        L("Maintenance"),
                        url: "host.maintenance",
                        icon: "icon-dashboard",
                        requiredPermissionName: AppPermissions.PagesAdministrationHostMaintenance
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Host.Setting",
                        L("Setting"),
                        url: "host.setting",
                        icon: "icon-cog",
                        requiredPermissionName: AppPermissions.PagesAdministrationHost
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Host.BackgroundJob",
                        L("BackgroundJob"),
                        url: "host.backgroundJob",
                        icon: "icon-tasks",
                        requiredPermissionName: AppPermissions.PagesAdministrationHostBackgroundJobs
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Host.AuditLog",
                        L("AuditLog"),
                        url: "host.auditLog",
                        icon: "icon-bolt",
                        requiredPermissionName: AppPermissions.PagesAdministrationHostAudtiLogs
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Host.Language",
                        L("Language"),
                        url: "host.language",
                        icon: "icon-cog",
                        requiredPermissionName: AppPermissions.PagesAdministrationHostLanguages
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Host.Address",
                        L("Address"),
                        url: "host.address",
                        icon: "icon-dashboard",
                        requiredPermissionName: AppPermissions.PagesAdministrationHostMaintenance
                        )
                        ).AddItem(
                    //Tenant
                    new MenuItemDefinition(
                        "Tenant.Setting",
                        L("Setting"),
                        url: "tenant.setting",
                        icon: "icon-cog",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.Dashboard",
                        L("Dashboard"),
                        url: "tenant.dashboard",
                        icon: "icon-group",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        )).AddItem(
                new MenuItemDefinition(
                    "Tenant.ShopTemplate",
                    L("ShopTemplateManager"),
                    icon: "icon-express",
                    requiredPermissionName: AppPermissions.PagesAdministrationTenant
                    ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.ShopTemplateManager.ShopTemplate",
                        L("ShopTemplate"),
                        url: "shopTemplate.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        ))
                        .AddItem(
                new MenuItemDefinition(
                    "Tenant.PublicWechatManager",
                    new LocalizableString("PublicWechatManager", ApplicationConsts.LocalizationSourceName),
                    icon: "icon-cog").AddItem(
                    new MenuItemDefinition(
                        "Tenant.PublicWechatManager.PublicWechat.Setting",
                        L("Setting"),
                        url: "publicWechat.setting",
                        icon: "icon-cog",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.PublicWechatManager.PublicWechat.MenuManager",
                        L("MenuManager"),
                        url: "publicWechat.menu",
                        icon: "icon-cog",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.PublicWechatManager.PublicWechat.AutoReplyManager",
                        L("AutoReplyManager"),
                        url: "publicWechat.autoReply.index",
                        icon: "icon-cog",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        )
                        ).AddItem(
                new MenuItemDefinition(
                    "Tenant.ArticleManager",
                    new LocalizableString("ArticleManager", ApplicationConsts.LocalizationSourceName),
                    icon: "icon-cog").AddItem(
                    new MenuItemDefinition(
                        "Tenant.ArticleManager.Article",
                        L("Article"),
                        url: "article.index",
                        icon: "icon-cog",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        )
                        ).AddItem(
                new MenuItemDefinition(
                    "Tenant.PictureTemplateManager",
                    L("PictureTemplateManager"),
                    icon: "icon-qrcode",
                    requiredPermissionName: AppPermissions.PagesAdministrationTenant
                    ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.PictureTemplateManager.PictureTemplateManager",
                        L("PictureTemplate"),
                        url: "pictureTemplate.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        )).AddItem(
                new MenuItemDefinition(
                    "Tenant.SpreadPosterManager",
                    L("SpreadPosterManager"),
                    icon: "icon-qrcode",
                    requiredPermissionName: AppPermissions.PagesAdministrationTenant
                    ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.SpreadPosterManager.SpreadPosterTemplate",
                        L("SpreadPoster"),
                        url: "spreadPosterTemplate.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        )).AddItem(
                new MenuItemDefinition(
                    "Tenant.MemberManager",
                    L("MemberManager"),
                    icon: "icon-member",
                    requiredPermissionName: AppPermissions.PagesAdministrationTenant
                    ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.MemberManager.MemberLevel",
                        L("MemberLevel"),
                        url: "memberLevel.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.MemberManager.MemberCardPackage",
                        L("MemberCardPackage"),
                        url: "memberCardPackage.index",
                        icon: "icon-film",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        )
                        .AddItem(
                    new MenuItemDefinition(
                        "Tenant.MemberManager.MemberCard",
                        L("MemberCard"),
                        url: "memberCard",
                        icon: "icon-film",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        )
                        ).AddItem(
                new MenuItemDefinition(
                    "Tenant.ProductManager",
                    L("ProductManager"),
                    icon: "icon-product",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                    ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.ProductManager.ProductCategory",
                        L("ProductCategory"),
                        url: "productCategory",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.ProductManager.SpecificationProperty",
                        L("SpecificationProperty"),
                        url: "specificationProperty.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.ProductManager.Product",
                        L("Product"),
                        url: "product.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        )).AddItem(
                new MenuItemDefinition(
                    "Tenant.ExpressCompanyManager",
                    L("ExpressCompanyManager"),
                    icon: "icon-express",
                    requiredPermissionName: AppPermissions.PagesAdministrationHost
                    ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.ExpressCompanyManager.ExpressCompany",
                        L("ExpressCompany"),
                        url: "expressCompany.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationHost
                        )
                        )).AddItem(
                new MenuItemDefinition(
                    "Tenant.FreightTemplateManager",
                    L("FreightTemplateManager"),
                    icon: "icon-express",
                    requiredPermissionName: AppPermissions.PagesAdministrationTenant
                    ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.FreightTemplateManager.FreightTemplate",
                        L("FreightTemplate"),
                        url: "freightTemplate.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        )).AddItem(
                new MenuItemDefinition(
                    "Tenant.WalletManager",
                    L("WalletManager"),
                    icon: "icon-wallet",
                    requiredPermissionName: AppPermissions.PagesAdministrationTenant
                    ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.WalletManager.WalletRecord",
                        L("WalletRecord"),
                        url: "walletManager.walletRecord.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.WalletManager.WithdrawApply",
                        L("WithdrawApply"),
                        url: "walletManager.withdrawApply.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        )).AddItem(
                new MenuItemDefinition(
                    "Tenant.ScoreManager",
                    L("ScoreManager"),
                    icon: "icon-score",
                    requiredPermissionName: AppPermissions.PagesAdministrationTenant
                    ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.ScoreManager.Score",
                        L("Score"),
                        url: "score.score.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.ScoreManager.ScoreRecord",
                        L("ScoreRecord"),
                        url: "score.scoreRecord.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        )).AddItem(
                new MenuItemDefinition(
                    "Tenant.OrderManager",
                    L("OrderManager"),
                    icon: "icon-order",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                    ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.OrderManager.Order",
                        L("Order"),
                        url: "order.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        )).AddItem(
                new MenuItemDefinition(
                    "Tenant.VirtualProductManager",
                    L("VirtualProductManager"),
                    icon: "icon-order",
                    requiredPermissionName: AppPermissions.PagesAdministrationTenant
                    ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.VirtualProductManager.VirtualCardManager",
                        L("VirtualCardManager"),
                        url: "virtualProduct.virtualCard.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        )).AddItem(
                new MenuItemDefinition(
                    "Tenant.GlobalRebateManager",
                    L("GlobalRebateManager"),
                    icon: "icon-channel",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                    ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.GlobalRebateManager.GlobalRebate",
                        L("GlobalRebate"),
                        url: "globalRebate.globalRebate.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        )).AddItem(
                new MenuItemDefinition(
                    "Tenant.ChannelManager",
                    L("ChannelManager"),
                    icon: "icon-channel",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                    ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.ChannelManager.ChannelAgent",
                        L("ChannelAgent"),
                        url: "channel.channelAgent.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.ChannelManager.ChannelAgencyApply",
                        L("ChannelAgencyApply"),
                        url: "channel.channelAgencyApply.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.ChannelManager.ChannelAgency",
                        L("ChannelAgency"),
                        url: "channel.channelAgency.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        )).AddItem(
                new MenuItemDefinition(
                    "Tenant.AreaManager",
                    L("AreaManager"),
                    icon: "icon-area-agent",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                    ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.AreaManager.AreaAgent",
                        L("AreaAgent"),
                        url: "areaAgent.areaAgent.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.AreaManager.AreaAgencyApply",
                        L("AreaAgencyApply"),
                        url: "areaAgent.areaAgencyApply.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        ).AddItem(
                    new MenuItemDefinition(
                        "Tenant.AreaManager.AreaAgency",
                        L("AreaAgency"),
                        url: "areaAgent.areaAgency.index",
                        icon: "icon-align-justify",
                        requiredPermissionName: AppPermissions.PagesAdministrationTenant
                        )
                        ));
        }

        private static ILocalizableString L(string name)
        {
            return new LocalizableString(name, ApplicationConsts.LocalizationSourceName);
        }
    }
}