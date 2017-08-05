using Application.Authorization.Users;
using Application.Channel.ChannelAgencies;
using Application.Channel.ChannelAgents;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using System.Linq;
using System.Threading.Tasks;
using System;
using Application.Channel.ChannelAgencys;
using Infrastructure.BackgroundJobs;
using Application.BackgroundJob;

namespace Application.Channel.ChananlAgencys
{
    public class ChannelAgencyManager : ApplicationDomainServiceBase
    {
        public ChannelAgencyNumberCreator AgencyNumberCreator { get; set; }

        public IRepository<User,long> UserRepository { get; set; }

        public IRepository<ChannelAgency> ChannelAgencyRepository { get; set; }

        public IRepository<ChannelAgencyApply> ChannelAgencyApplyRepository { get; set; }
        private readonly IBackgroundJobManager _backgroundJobManager;

        public ChannelAgencyManager(IBackgroundJobManager backgroundJobManager)
        {
            _backgroundJobManager = backgroundJobManager;
        }

        public ChannelAgency GetChannelAgencyOfUser(long userId)
        {
            return ChannelAgencyRepository.GetAll().Where(model => model.UserId == userId).FirstOrDefault();
        }

        [UnitOfWork]
        public ChannelAgency CreateChannelAgency(ChannelAgent channelAgent, User user)
        {
            using (CurrentUnitOfWork.SetTenantId(user.TenantId))
            {
                if (user.IsChannelAgency)
                {
                    ChannelAgency currentChannelAgency = ChannelAgencyRepository.Get(user.UserChannelAgencyId.Value);

                    if (currentChannelAgency.ChannelAgentId == channelAgent.Id)
                    {
                        throw new Exception(L("YouHasBeenThisChannelAgent"));
                    }
                    ChannelAgencyRepository.Delete(currentChannelAgency);
                }
                ChannelAgency channelAgency = new ChannelAgency()
                {
                    UserId = user.Id,
                    ChannelAgentId = channelAgent.Id,
                    RebateRatio = channelAgent.RebateRatio,
                    Number= AgencyNumberCreator.GetNumber()
                };
                ChannelAgencyRepository.Insert(channelAgency);
                CurrentUnitOfWork.SaveChanges();

                user.IsChannelAgency = true;
                user.UserChannelAgencyId = channelAgency.Id;
                UserRepository.Update(user);

                CurrentUnitOfWork.Completed += ((object sender, EventArgs e) =>
                {
                    _backgroundJobManager.Enqueue<ProcessChannlRelationChainJob, ProcessChannlRelationChainJobArgs>(new ProcessChannlRelationChainJobArgs() {
                        ChannelAgencyId=channelAgency.Id});
                });
                return channelAgency;
            }
        }

        [UnitOfWork]
        public async Task ProcessChannlRelationChain(ChannelAgency channelAgency)
        {
            using (CurrentUnitOfWork.SetTenantId(channelAgency.TenantId))
            {
                User user = UserRepository.Get(channelAgency.UserId);

                await Task.Run(() =>
                {
                    ProcessChannlRelationChainRecursion(user, channelAgency);
                });
            }  
        }

        private void ProcessChannlRelationChainRecursion(User user, ChannelAgency channelAgency, int depth = 1)
        {
            if (user.Children.Count > 0)
            {
                foreach (User childUser in user.Children)
                {
                    childUser.ChannelAgentDepth = depth;
                    childUser.ChannelAgencyId = channelAgency.Id;
                    channelAgency.ChildCount++;

                    if (!childUser.IsChannelAgency)
                    {
                        ProcessChannlRelationChainRecursion(childUser, channelAgency, depth + 1);
                    }
                }
            }
        }

        public ChannelAgency AddNewCustomer(int channelAgencyId,int depth)
        {
            ChannelAgency channelAgency = ChannelAgencyRepository.Get(channelAgencyId);
            channelAgency.ChildCount++;

            if (depth > channelAgency.Depth)
            {
                channelAgency.Depth = depth;
            }
            ChannelAgencyRepository.Update(channelAgency);
            return channelAgency;
        }
    }
}
