using Application.Orders.Entities;
using Application.Products.Orders;
using Application.Products.Orders.Entities;
using Infrastructure.Auditing;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Threading.BackgroundWorkers;
using Infrastructure.Threading.Timers;
using System;

namespace Application.BackgroundWorker
{
    public class MakeOvertimeProductOrdersDeletedBackgroundWorker : PeriodicBackgroundWorkerBase, ISingletonDependency
    {
        private readonly IRepository<ProductOrder> _orderRepository;
        private ProductOrderManager _orderManager;

        public MakeOvertimeProductOrdersDeletedBackgroundWorker(
            ProductOrderManager orderManager,
            InfrastructureTimer timer, 
            IRepository<ProductOrder> orderRepository)
        : base(timer)
        {
            _orderManager = orderManager;
            _orderRepository = orderRepository;
            Timer.Period = 7200000; 
        }

        [UnitOfWork]
        [Audited]
        protected override void DoWork()
        {
            using (CurrentUnitOfWork.DisableFilter(DataFilters.MustHaveTenant))
            {
                DateTime dateTime = DateTime.Now.AddHours(-2);
                var overTimeOrders = _orderRepository.GetAllList(model=>model.OrderStatus==OrderStatus.UnPay
                &&model.CreationTime< dateTime);

                foreach (var order in overTimeOrders)
                {
                    _orderManager.CloseOrder(order);
                }
            }
        }
    }
}
