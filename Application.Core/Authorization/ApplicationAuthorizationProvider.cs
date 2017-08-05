using Infrastructure.Authorization;
using Infrastructure.Localization;
using Infrastructure.MultiTenancy;

namespace Application.Authorization
{
    public class ApplicationAuthorizationProvider : AuthorizationProvider
    {
        public override void SetPermissions(IPermissionDefinitionContext context)
        {
            //Common permissions
            var pages = context.GetPermissionOrNull(AppPermissions.Pages);

            if (pages == null)
            {
                pages = context.CreatePermission(AppPermissions.Pages, L("Pages"));
            }
            var administration= pages.CreateChildPermission(AppPermissions.PagesAdministration, L("Administration"));

            //Common
            var administrationCommon = administration.CreateChildPermission(AppPermissions.PagesAdministrationCommon, L("Administration"));

            var users = administrationCommon.CreateChildPermission(AppPermissions.PagesAdministrationCommonUsers, L("Users"));
            var roles = administrationCommon.CreateChildPermission(AppPermissions.PagesAdministrationCommonRoles, L("Roles"));

            //Host permissions
            var administrationHost = pages.CreateChildPermission(AppPermissions.PagesAdministrationHost, L("AdministrationHost"),
                multiTenancySides: MultiTenancySides.Host);

            var tenants = administrationHost.CreateChildPermission(AppPermissions.PagesAdministrationHostTenants, L("Tenants"), 
                multiTenancySides: MultiTenancySides.Host);
            var editions = administrationHost.CreateChildPermission(AppPermissions.PagesAdministrationHostEditions, L("Editions"),
                multiTenancySides: MultiTenancySides.Host);
            var maintenance = administrationHost.CreateChildPermission(AppPermissions.PagesAdministrationHostMaintenance, L("Maintenance"), 
                multiTenancySides: MultiTenancySides.Host);
            var settings = administrationHost.CreateChildPermission(AppPermissions.PagesAdministrationHostSettings, L("Settings"), 
                multiTenancySides: MultiTenancySides.Host);
            var languages = administrationHost.CreateChildPermission(AppPermissions.PagesAdministrationHostLanguages, L("Languages"),
                multiTenancySides: MultiTenancySides.Host);
            var audtiLogs = administrationHost.CreateChildPermission(AppPermissions.PagesAdministrationHostAudtiLogs, L("AudtiLogs"),
                multiTenancySides: MultiTenancySides.Host);
            var backgroundJobs = administrationHost.CreateChildPermission(AppPermissions.PagesAdministrationHostBackgroundJobs, L("BackgroundJobs"),
                multiTenancySides: MultiTenancySides.Host);

            //Tenant permissions
            var administrationTenant = administration.CreateChildPermission(AppPermissions.PagesAdministrationTenant, L("Business"),
                multiTenancySides: MultiTenancySides.Tenant);
        }

        private static ILocalizableString L(string name)
        {
            return new LocalizableString(name, ApplicationConsts.LocalizationSourceName);
        }
    }
}
