using Application.Wallets;
using Application.Wallets.Entities;
using Infrastructure.Auditing;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Threading;
using Infrastructure.Threading.BackgroundWorkers;
using Infrastructure.Threading.Timers;
using System;

namespace Application.BackgroundWorker
{
    public class WithdrawFailedWithdrawBackgroundWorker : PeriodicBackgroundWorkerBase, ISingletonDependency
    {
        private readonly IRepository<WithdrawApply> _withdrawApplyRepository;
        public WithdrawManager WithdrawManager { get; set; }
        public WithdrawFailedWithdrawBackgroundWorker(InfrastructureTimer timer, IRepository<WithdrawApply> withdrawApplyRepository) 
            : base(timer)
        {
            _withdrawApplyRepository = withdrawApplyRepository;
            Timer.Period = 7200000;
        }

        [UnitOfWork]
        [Audited]
        protected override void DoWork()
        {
            using (CurrentUnitOfWork.DisableFilter(DataFilters.MustHaveTenant))
            {
                DateTime dateTime = DateTime.Now.AddHours(-2);
                AsyncHelper.RunSync(async() =>
                {
                    var withdrawApplys = _withdrawApplyRepository.GetAllList(model => model.Status == WithdrawStatus.Fail
                    && model.CreationTime < dateTime);

                    foreach (var withdrawApply in withdrawApplys)
                    {
                        await WithdrawManager.ProcessWithdrawAsync(withdrawApply);
                    }
                });
            }
        }
    }
}
