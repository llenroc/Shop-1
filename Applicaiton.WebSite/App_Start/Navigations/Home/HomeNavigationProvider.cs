using Application.Authorization;
using Infrastructure.Application.Navigation;
using Infrastructure.Localization;

namespace Application.WebSite.Navigations.Home
{
    public class HomeNavigationProvider : NavigationProvider
    {
        public const string MenuName = "HomeMenu";  //自定义导航属性

        public override void SetNavigation(INavigationProviderContext context)
        {
            var menu = new MenuDefinition(MenuName, new FixedLocalizableString("Home Menu"));
            context.Manager.Menus[MenuName] = menu;
            menu.AddItem(new MenuItemDefinition(
                    PageNames.Frontend.Home,
                    L("HomePage"),
                    url: ""
                    )
                )
                .AddItem(new MenuItemDefinition(
                    PageNames.Frontend.About,
                    L("AboutUs"),
                    url: "About"
                    )
                );
        }

        private static ILocalizableString L(string name)
        {
            return new LocalizableString(name, ApplicationConsts.LocalizationSourceName);
        }
    }
}