namespace Application.Authorization
{
    public static class AppPermissions
    {
        public const string Pages = "Pages";
        public const string PagesAdministration = "Pages.Administration";

        //HOST-SPECIFIC PERMISSIONS
        public const string PagesAdministrationHost = "Pages.Administration.Host";
        public const string PagesAdministrationHostTenants = "Pages.Administration.Host.Tenants";
        public const string PagesAdministrationHostEditions = "Pages.Administration.Host.Editions";
        public const string PagesAdministrationHostMaintenance = "Pages.Administration.Host.Maintenance";
        public const string PagesAdministrationHostSettings = "Pages.Administration.Host.Settings";
        public const string PagesAdministrationHostLanguages = "Pages.Administration.Host.Languages";
        public const string PagesAdministrationHostAudtiLogs = "Pages.Administration.Host.AudtiLogs";
        public const string PagesAdministrationHostBackgroundJobs = "Pages.Administration.Host.BackgroundJobs";

        //COMMON PERMISSIONS (FOR BOTH OF TENANTS AND HOST)
        public const string PagesAdministrationCommon = "Pages.Administration.Common";
        public const string PagesAdministrationCommonUsers = "Pages.Administration.Common.Users";
        public const string PagesAdministrationCommonRoles = "Pages.Administration.Common.Roles";

        //Tenant-SPECIFIC PERMISSIONS
        public const string PagesAdministrationTenant = "Pages.Administration.Tenant";
    }
}