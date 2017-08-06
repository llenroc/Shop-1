using Application.Sales;
using Infrastructure.Dependency;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Threading.BackgroundWorkers;
using Infrastructure.Threading.Timers;

namespace Application.BackgroundWorker
{
    public class ComputeSalesRankBackgroundWorker : PeriodicBackgroundWorkerBase, ISingletonDependency
    {
        public SalesManager SalesManager { get; set; }

        public ComputeSalesRankBackgroundWorker(InfrastructureTimer timer): base(timer)
        {
            Timer.Period = 86400000;
        }

        [UnitOfWork]
        protected override void DoWork()
        {
            SalesManager.RankAsync();
        }
    }
}
