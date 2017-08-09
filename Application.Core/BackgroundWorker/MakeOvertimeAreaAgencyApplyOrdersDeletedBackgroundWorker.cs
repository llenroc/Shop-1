using Application.AreaAgents.AreaAgencyApplys.Orders;
using Application.AreaAgents.AreaAgencyApplys.Orders.Entities;
using Application.Orders.Entities;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Threading.BackgroundWorkers;
using Infrastructure.Threading.Timers;
using System;

namespace Application.BackgroundWorker
{
    public class MakeOvertimeAreaAgencyApplyOrdersDeletedBackgroundWorker :
        PeriodicBackgroundWorkerBase,
        ISingletonDependency
    {
        private readonly IRepository<AreaAgencyApplyOrder> _orderRepository;
        private AreaAgencyApplyOrderManager _orderManager;

        public MakeOvertimeAreaAgencyApplyOrdersDeletedBackgroundWorker(
            AreaAgencyApplyOrderManager orderManager,
            InfrastructureTimer timer,
            IRepository<AreaAgencyApplyOrder> orderRepository)
        : base(timer)
        {
            _orderManager = orderManager;
            _orderRepository = orderRepository;
            Timer.Period = 7200000;
        }

        [UnitOfWork]
        protected override void DoWork()
        {
            using (CurrentUnitOfWork.DisableFilter(DataFilters.MustHaveTenant,DataFilters.MayHaveTenant))
            {
                DateTime dateTime = DateTime.Now.AddHours(-2);
                var overTimeOrders = _orderRepository.GetAllList(model => model.OrderStatus == OrderStatus.UnPay
                && model.CreationTime < dateTime);

                foreach (var order in overTimeOrders)
                {
                    _orderManager.CloseOrder(order);
                }
            }
        }
    }
}
