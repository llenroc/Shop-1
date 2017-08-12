using Application.Authorization.Users;
using Application.BackgroundJob;
using Infrastructure.BackgroundJobs;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Spread.Shares
{
    public class ShareManager:ApplicationDomainServiceBase
    {
        public IRepository<User, long> UserRepository { get; set; }
        public IRepository<Share> ShareRepository { get; set; }
        public IRepository<ShareAccess> ShareAccessRepository { get; set; }
        public UserManager UserManager { get; set; }
        private readonly IBackgroundJobManager _backgroundJobManager;

        public ShareManager(IBackgroundJobManager backgroundJobManager)
        {
            _backgroundJobManager = backgroundJobManager;
        }

        [UnitOfWork]
        public async Task<Share> ProcessShareAccessAsync(string shareNo,long sourceUserId)
        {
            User sourceUser = UserRepository.Get(sourceUserId);
            Share share = ShareRepository.GetAll().Where(model => model.No == shareNo).FirstOrDefault();

            if (share == null)
            {
                return null;
            }
            ShareAccess shareAccess = ShareAccessRepository.GetAll().Where(model => model.CreatorUserId == sourceUserId && model.ShareId == share.Id).FirstOrDefault();

            if (shareAccess!=null)
            {
                return share;
            }
            CurrentUnitOfWork.Completed+= (sender, args) => {
                _backgroundJobManager.Enqueue<BindParentJob, BindParentJobArgs>(new BindParentJobArgs() {
                    SourceUserId = sourceUser.Id,
                    ParentUserId = share.CreatorUser.Id });
            };
            await UserManager.BindParentAsync(sourceUser, share.CreatorUser);
            shareAccess = new ShareAccess()
            {
                ShareId = share.Id
            };
            ShareAccessRepository.Insert(shareAccess);
            return share;
        }
    }
}
