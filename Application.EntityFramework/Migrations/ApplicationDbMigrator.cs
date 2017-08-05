using Infrastructure.Dependency;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.MultiTenancy;
using Infrastructure.CommonFrame.EntityFramework;
using Application.EntityFramework;

namespace Application.Migrations
{
    public class ApplicationDbMigrator : DbMigrator<ApplicationDbContext, Configuration>
    {
        public ApplicationDbMigrator(
            IUnitOfWorkManager unitOfWorkManager,
            IDbPerTenantConnectionStringResolver connectionStringResolver,
            IIocResolver iocResolver)
            : base(
                unitOfWorkManager,
                connectionStringResolver,
                iocResolver)
        {
        }
    }
}
