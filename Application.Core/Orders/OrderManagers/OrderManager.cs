using Application.Authorization.Users;
using Application.Orders.BoughtContexts;
using Application.Orders.Entities;
using Application.Orders.Events;
using Application.Orders.Notifications;
using Application.Pay.PayProviders;
using Application.Wallets.Entities;
using Infrastructure;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Runtime.Session;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Orders
{
    public abstract class OrderManager<TOrder, TBoughtContext> : ApplicationDomainServiceBase
        where TOrder : Order,new()
        where TBoughtContext:IBoughtContext<TOrder>
    {
        protected IRepository<TOrder> OrderRepository;

        protected IRepository<User, long> UserRepository;

        public IInfrastructureSession Session { get; set; }

        public IOrderNotifier OrderNotifier { get; set; }

        public IIocResolver IocResolver { get; set; }

        public OrderManager(
            IRepository<TOrder> orderRepository, 
            IRepository<User, long> userRepository
            )
        {
            OrderRepository = orderRepository;
            UserRepository = userRepository;
        }

        [UnitOfWork]
        public TOrder GetOrderFromNumber(string orderNumber)
        {
            using (CurrentUnitOfWork.DisableFilter(DataFilters.MustHaveTenant))
            {
                TOrder order = OrderRepository.FirstOrDefault(model => model.Number == orderNumber);
                return order;
            }
        }

        [UnitOfWork]
        public async Task<TOrder> PayCallback(string orderNumber, PayType payType)
        {
            using (CurrentUnitOfWork.DisableFilter(DataFilters.MustHaveTenant,DataFilters.MayHaveTenant))
            {
                TOrder order = OrderRepository.GetAll().Where(model => model.Number == orderNumber).FirstOrDefault();
                await PayCallback(order, payType);
                return order;
            }
        }

        [UnitOfWork]
        public async Task<TOrder> PayCallback(TOrder order,PayType payType)
        {
            await PayedAsync(order, payType);
            return order;
        }

        [UnitOfWork]
        public async Task PayedAsync(TOrder order, PayType payType)
        {
            if (order.PaymentStatus == PaymentStatus.Payed)
            {
                throw new InfrastructureException(L("OrderHasPayed"));
            }
            order.PayType = payType;
            order.PaymentStatus = PaymentStatus.Payed;
            order.PaymentDatetime = DateTime.Now;

            order.OrderStatus = OrderStatus.UnShip;
            OrderRepository.Update(order);
            await CurrentUnitOfWork.SaveChangesAsync();

            EventBus.Trigger(new OrderPayedEventData(order));

            await OrderNotifier.OrderPayed(order);
            await CurrentUnitOfWork.SaveChangesAsync();
        }

        [UnitOfWork]
        public async Task Refund(TOrder order,decimal refundFee)
        {
            order.RefundStatus = RefundStatus.Refunded;
            //todo

            switch (order.PayType)
            {
                case PayType.WeChat:
                    IPayProvider payProvider = IocResolver.Resolve<WechatPayProvider>();
                    await payProvider.Refund(order, refundFee);
                    break;
            }
            EventBus.Trigger(new OrderRefundEventData(order));
        }

        public virtual TOrder Receive(TOrder order)
        {
            return order;
        }

        protected virtual void PreCloseOrder(TOrder order)
        {

        }

        [UnitOfWork]
        public void CloseOrder(TOrder order)
        {
            order.OrderStatus = OrderStatus.Close;
            PreCloseOrder(order);
            CurrentUnitOfWork.SaveChanges();
        }

        [UnitOfWork]
        public virtual TOrder CompleteShip(TOrder order, ExpressInfo expreeInfo = null)
        {
            return order;
        }

        [UnitOfWork]
        public TOrder CompleteOrder(TOrder order)
        {
            order.OrderStatus = OrderStatus.Completed;
            CurrentUnitOfWork.SaveChanges();

            EventBus.Trigger(new OrderCompletedEventData(order));
            return order;
        }

        public virtual void Ship(string orderNumber, string expressCompanyName, string trackingNumber)
        {
        }

        public virtual async Task<TOrder> ShipAsync(TOrder order, bool autoShip = false, ExpressInfo expressInfo = null)
        {
            return await Task.FromResult(order);
        }
    }
}
