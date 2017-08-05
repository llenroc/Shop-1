using Infrastructure.Application.Navigation;
using Infrastructure.Localization;

namespace Application.WebSite.Navigations.Mobile
{
    public class MobileFooterNavigationProvider : NavigationProvider
    {
        public const string MenuName = "FooterMenu";


        public override void SetNavigation(INavigationProviderContext context)
        {
            var menu = new MenuDefinition(MenuName, new FixedLocalizableString("Footer Menu"));
            context.Manager.Menus[MenuName] = menu;

            menu.AddItem(
                new MenuItemDefinition(
                    "Mobile.Home",
                    new LocalizableString("Home", ApplicationConsts.LocalizationSourceName),
                    url: "/Mobile/Home/Index",
                    icon: "/Content/Images/FooterNav/home.png")
                    ).AddItem(
                new MenuItemDefinition(
                    "Mobile.ShopCart",
                    new LocalizableString("ShopCart", ApplicationConsts.LocalizationSourceName),
                    url: "/Mobile/ShopCart/Index",
                    icon: "/Content/Images/FooterNav/shop-cart.png")
                    ).AddItem(
                new MenuItemDefinition(
                    "Mobile.User",
                    new LocalizableString("User", ApplicationConsts.LocalizationSourceName),
                    url: "/Mobile/Member/Index",
                    icon: "/Content/Images/FooterNav/user-center.png")
                    ).AddItem(
                new MenuItemDefinition(
                    "Mobile.SpreadPoster",
                    new LocalizableString("SpreadPoster", ApplicationConsts.LocalizationSourceName),
                    url: "/Mobile/SpreadPoster/Index",
                    icon: "/Content/Images/FooterNav/qrcode.png")
                    );
        }

        private static ILocalizableString L(string name)
        {
            return new LocalizableString(name, ApplicationConsts.LocalizationSourceName);
        }
    }
}