using Application.Migrations.SeedData;
using EntityFramework.DynamicFilters;
using Infrastructure.MultiTenancy;
using System.Data.Entity;

namespace Application.EntityFramework
{
    public class DatabaseInitializerForCreateDatabaseIfNotExists : CreateDatabaseIfNotExists<ApplicationDbContext>
    {
        public TenantBase Tenant { get; set; }

        public override void InitializeDatabase(ApplicationDbContext context)
        {
            base.InitializeDatabase(context);
        }

        protected override void Seed(ApplicationDbContext context)
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
            //context.Database.ExecuteSqlCommand();
            context.SaveChanges();
        }
    }
}