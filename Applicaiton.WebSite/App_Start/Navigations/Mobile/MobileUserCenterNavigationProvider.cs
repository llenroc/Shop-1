using Infrastructure.Application.Navigation;
using Infrastructure.Localization;

namespace Application.WebSite.Navigations.Mobile
{
    public class MobileUserCenterNavigationProvider : NavigationProvider
    {
        public const string MenuName = "UserCenterMenu";


        public override void SetNavigation(INavigationProviderContext context)
        {
            var menu = new MenuDefinition(MenuName, new FixedLocalizableString("Footer Menu"));
            context.Manager.Menus[MenuName] = menu;

            menu.AddItem(
                new MenuItemDefinition(
                    "Mobile.Order",
                    new LocalizableString("MyOrder", ApplicationConsts.LocalizationSourceName),
                    url: "/Mobile/Order/Index",
                    icon: "/Content/Images/UserCenterNav/order.png")
                    ).AddItem(
                new MenuItemDefinition(
                    "Mobile.Group",
                    new LocalizableString("AgentOrder", ApplicationConsts.LocalizationSourceName),
                    url: "/Mobile/AgentOrder/Index",
                    icon: "/Content/Images/UserCenterNav/agentOrder.png")
                    ).AddItem(
                new MenuItemDefinition(
                    "Mobile.Group",
                    new LocalizableString("MyGroup", ApplicationConsts.LocalizationSourceName),
                    url: "/Mobile/Group/Index",
                    icon: "/Content/Images/UserCenterNav/group.png")
                    ).AddItem(
                new MenuItemDefinition(
                    "Mobile.Profile",
                    new LocalizableString("MyProfile", ApplicationConsts.LocalizationSourceName),
                    url: "/Mobile/Profile/Detail",
                    icon: "/Content/Images/UserCenterNav/profile.png")
                    ).AddItem(
                //new MenuItemDefinition(
                //    "Mobile.ChannelAgency",
                //    new LocalizableString("ChannelAgent", ApplicationConsts.LocalizationSourceName),
                //    url: "/Mobile/ChannelAgency/Index",
                //    icon: "/Content/Images/UserCenterNav/channel.png")
                //    ).AddItem(
                //new MenuItemDefinition(
                //    "Mobile.AreaAgency",
                //    new LocalizableString("AreaAgent", ApplicationConsts.LocalizationSourceName),
                //    url: "/Mobile/AreaAgent/Index",
                //    icon: "/Content/Images/UserCenterNav/areaAgent.png")
                //    ).AddItem(
                new MenuItemDefinition(
                    "Mobile.MySpread",
                    new LocalizableString("MySpread", ApplicationConsts.LocalizationSourceName),
                    url: "/Mobile/Spread/Index",
                    icon: "/Content/Images/UserCenterNav/spread.png")
                    ).AddItem(
                new MenuItemDefinition(
                    "Mobile.Article",
                    new LocalizableString("MaterialCenter", ApplicationConsts.LocalizationSourceName),
                    url: "/Mobile/Article/Index",
                    icon: "/Content/Images/UserCenterNav/article.png")
                    ).AddItem(
                new MenuItemDefinition(
                    "Mobile.Wallet",
                    new LocalizableString("MyWallet", ApplicationConsts.LocalizationSourceName),
                    url: "/Mobile/Wallet/Index",
                    icon: "/Content/Images/UserCenterNav/wallet.png")
                    ).AddItem(
                new MenuItemDefinition(
                    "Mobile.CustomerInfo",
                    new LocalizableString("CustomerInfo", ApplicationConsts.LocalizationSourceName),
                    url: "/Mobile/CustomerInfo/Index",
                    icon: "/Content/Images/UserCenterNav/address.png")
                    ).AddItem(
                new MenuItemDefinition(
                    "Mobile.SalesRank",
                    new LocalizableString("SalesRank", ApplicationConsts.LocalizationSourceName),
                    url: "/Mobile/SalesRank/Index",
                    icon: "/Content/Images/UserCenterNav/rank.png")
                    );
        }

        private static ILocalizableString L(string name)
        {
            return new LocalizableString(name, ApplicationConsts.LocalizationSourceName);
        }
    }
}