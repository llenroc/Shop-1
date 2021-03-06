﻿using Application.Wallets;
using Application.Wallets.Entities;
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
        private WithdrawManager _withdrawManager { get; set; }
        public WithdrawFailedWithdrawBackgroundWorker(
            WithdrawManager withdrawManager,
            InfrastructureTimer timer,
            IRepository<WithdrawApply> withdrawApplyRepository) 
            : base(timer)
        {
            _withdrawManager = _withdrawManager;
            _withdrawApplyRepository = withdrawApplyRepository;
            Timer.Period = 7200000;
        }

        [UnitOfWork]
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
                        await _withdrawManager.ProcessWithdrawAsync(withdrawApply);
                    }
                });
            }
        }
    }
}
