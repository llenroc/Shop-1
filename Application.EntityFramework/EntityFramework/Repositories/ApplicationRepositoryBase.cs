using Infrastructure.Domain.Entities;
using Infrastructure.EntityFramework;
using Infrastructure.EntityFramework.Repositories;

namespace Application.EntityFramework.Repositories
{
    public abstract class ApplicationRepositoryBase<TEntity, TPrimaryKey> : EfRepositoryBase<ApplicationDbContext, TEntity, TPrimaryKey>where TEntity : class, IEntity<TPrimaryKey>
    {
        protected ApplicationRepositoryBase(IDbContextProvider<ApplicationDbContext> dbContextProvider): base(dbContextProvider)
        {

        }

        //add common methods for all repositories
    }

    public abstract class ApplicationRepositoryBase<TEntity> : ApplicationRepositoryBase<TEntity, int>  where TEntity : class, IEntity<int>
    {
        protected ApplicationRepositoryBase(IDbContextProvider<ApplicationDbContext> dbContextProvider) : base(dbContextProvider)
        {

        }

        //do not add any method here, add to the class above (since this inherits it)
    }
}
