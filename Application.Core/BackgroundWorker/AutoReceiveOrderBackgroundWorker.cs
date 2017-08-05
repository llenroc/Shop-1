using Application.Orders.Entities;
using Application.Products.Orders;
using Application.Products.Orders.Entities;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Threading.BackgroundWorkers;
using Infrastructure.Threading.Timers;
using System;

namespace Application.BackgroundWorker
{
    public class AutoReceiveOrderBackgroundWorker : PeriodicBackgroundWorkerBase, ISingletonDependency
    {
        private readonly IRepository<ProductOrder> _orderRepository;
        private ProductOrderManager _orderManager;

        public AutoReceiveOrderBackgroundWorker(
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
        protected override void DoWork()
        {
            using (CurrentUnitOfWork.DisableFilter(DataFilters.MustHaveTenant))
            {
                DateTime dateTime = DateTime.Now;
                var overTimeOrders = _orderRepository.GetAllList(model => model.OrderStatus == OrderStatus.Shiped
                && model.AutoReceiveLimit>=dateTime);

                foreach (var order in overTimeOrders)
                {
                    _orderManager.Receive(order);
                }
            }
        }
    }
}
