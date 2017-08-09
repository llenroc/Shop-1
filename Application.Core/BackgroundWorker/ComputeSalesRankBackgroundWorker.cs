using Application.Sales;
using Infrastructure.Dependency;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Threading.BackgroundWorkers;
using Infrastructure.Threading.Timers;

namespace Application.BackgroundWorker
{
    public class ComputeSalesRankBackgroundWorker : PeriodicBackgroundWorkerBase, ISingletonDependency
    {
        protected SalesManager _salesManager;

        public ComputeSalesRankBackgroundWorker(SalesManager salesManager, InfrastructureTimer timer) : base(timer)
        {
            _salesManager = salesManager;
            Timer.Period = 7200000;
        }

        [UnitOfWork]
        protected override void DoWork()
        {
            _salesManager.Rank();
        }
    }
}
