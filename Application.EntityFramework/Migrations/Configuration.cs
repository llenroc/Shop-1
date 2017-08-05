using Application.Migrations.SeedData;
using EntityFramework.DynamicFilters;
using Infrastructure.CommonFrame.EntityFramework;
using Infrastructure.MultiTenancy;
using System.Data.Entity.Migrations;

namespace Application.Migrations
{
    public sealed class Configuration : DbMigrationsConfiguration<EntityFramework.ApplicationDbContext>, IMultiTenantSeed
    {
        public TenantBase Tenant { get; set; }

        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            AutomaticMigrationDataLossAllowed = true;
            ContextKey = "Application";
        }

        protected override void Seed(EntityFramework.ApplicationDbContext context)
        {
            // This method will be called every time after migrating to the latest version.
            // You can add any seed data here...
            context.DisableAllFilters();

            if (Tenant == null)
            {
                //Host seed
                new InitialHostDbBuilder(context).Create();

                //Default tenant seed (in host database).
                new DefaultTenantCreator(context).Create();
                new TenantRoleAndUserBuilder(context, 1).Create();
            }
            else
            {
                //You can add seed for tenant databases and use Tenant property...
            }
            context.SaveChanges();
        }
    }
}
