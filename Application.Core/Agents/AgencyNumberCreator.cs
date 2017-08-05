using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using System;
using System.Linq;

namespace Application.Agents
{
    public abstract class AgencyNumberCreator<TEntity>:ISingletonDependency
        where TEntity: AgencyBase
    {
        protected IRepository<TEntity> Repository { get; set; }
        public string Prefix{get;set;}

        public AgencyNumberCreator(string prefix, IRepository<TEntity> repository)
        {
            Prefix = prefix;
            Repository = repository;
        }

        protected string GetDateSection()
        {
            return DateTime.Now.ToString("yyyyMMdd");
        }

        protected virtual string GetSortNumber()
        {
            var today = DateTime.Now.Day;
            int count = Repository.GetAll().Where(model => model.CreationTime.Day == today).Count();
            count += 1;

            if (count < 1000)
            {
                return count.ToString("0000");
            }
            return count.ToString();
        }

        public string GetNumber()
        {
            return Prefix + GetDateSection() + GetSortNumber();
        }
    }
}
