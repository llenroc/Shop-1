using Application.Authorization.Users;
using Infrastructure.BackgroundJobs;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Threading;

namespace Application.BackgroundJob
{
    public class BindParentJob : BackgroundJob<BindParentJobArgs>, ITransientDependency
    {
        private readonly IRepository<User, long> _userRepository;
        public UserManager UserManager { get; set; }

        public BindParentJob(IRepository<User, long> userRepository)
        {
            _userRepository = userRepository;
        }

        [UnitOfWork]
        public override void Execute(BindParentJobArgs args)
        {
            using (CurrentUnitOfWork.DisableFilter(DataFilters.MayHaveTenant, DataFilters.MustHaveTenant))
            {
                var sourceUser = _userRepository.Get(args.SourceUserId);
                var parentUser = _userRepository.Get(args.ParentUserId);

                AsyncHelper.RunSync(async () =>
                {
                    await UserManager.BindParentAsync(sourceUser, parentUser);
                });
            }
        }
    }
}
