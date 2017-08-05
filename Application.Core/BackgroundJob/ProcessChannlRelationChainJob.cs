using Application.Channel.ChananlAgencys;
using Application.Channel.ChannelAgencies;
using Infrastructure.BackgroundJobs;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Threading;

namespace Application.BackgroundJob
{
    public class ProcessChannlRelationChainJob : BackgroundJob<ProcessChannlRelationChainJobArgs>, ITransientDependency
    {
        private readonly IRepository<ChannelAgency> _channelAgencyRepository;
        public ChannelAgencyManager ChannelAgencyManager { get; set; }

        public ProcessChannlRelationChainJob(IRepository<ChannelAgency> channelAgencyRepository)
        {
            _channelAgencyRepository = channelAgencyRepository;
        }

        [UnitOfWork]
        public override void Execute(ProcessChannlRelationChainJobArgs args)
        {
            using (CurrentUnitOfWork.DisableFilter(DataFilters.MayHaveTenant, DataFilters.MustHaveTenant))
            {
                var channelAgency = _channelAgencyRepository.Get(args.ChannelAgencyId);

                AsyncHelper.RunSync(async () =>
                {
                    await ChannelAgencyManager.ProcessChannlRelationChain(channelAgency);
                });
            }
        }
    }
}
