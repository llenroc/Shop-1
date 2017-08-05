using Application.Authorization.Users;
using Application.Orders.BoughtContexts;
using Application.Orders.Entities;
using Application.Orders.Events;
using Application.Orders.Notifications;
using Application.Orders.NumberProviders;
using Application.Orders.SalePriceProviders;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Runtime.Session;
using System;
using System.Threading.Tasks;

namespace Application.Orders
{
    public abstract class OrderCreator<TOrder, TBoughtContext> : ApplicationDomainServiceBase
        where TOrder : Order,new()
        where TBoughtContext : IBoughtContext<TOrder>
    {
        protected IRepository<TOrder> OrderRepository;

        protected IRepository<User, long> UserRepository;

        public IInfrastructureSession Session { get; set; }

        public INumberProvider NumberProvider { get; set; }

        public IOrderNotifier OrderNotifier { get; set; }

        public ISalePriceProvider<TBoughtContext> SalePriceProvider { get; set; }

        public OrderCreator(
            IRepository<TOrder> orderRepository,
            IRepository<User, long> userRepository,
            ISalePriceProvider<TBoughtContext> salePriceProvider
            )
        {
            OrderRepository = orderRepository;
            UserRepository = userRepository;
            NumberProvider = new DefaultNumberProvider();
            SalePriceProvider = salePriceProvider;
        }

        protected virtual TOrder CreateBaseOrderModel()
        {
            TOrder order = new TOrder()
            {
                UserId = Session.UserId.Value,
                PaymentStatus = PaymentStatus.ToPay,
                RefundStatus = RefundStatus.ToRefund,
            };
            return order;
        }

        public async virtual Task<TOrder> CreateOrder(TBoughtContext boughtContext)
        {
            TOrder order = await Create(boughtContext);
            return order;
        }

        public virtual async Task<bool> CheckBuyPermissionAsync()
        {
            return await Task.FromResult(true);
        }

        [UnitOfWork]
        protected async Task<TOrder> Create(TBoughtContext boughtContext)
        {
            await CheckBuyPermissionAsync();

            PreCreate(boughtContext);
            boughtContext.Order = CreateBaseOrderModel();
            PreProcessOrderData(boughtContext);
            SalePriceProvider.Caculate(boughtContext);
            AssignNumber(boughtContext);
            AssignMoney(boughtContext);
            AssignScore(boughtContext);
            CustomerAssgin(boughtContext);
            AssignTitle(boughtContext);
            await OrderRepository.InsertAsync(boughtContext.Order);
            PostCreate(boughtContext);
            CurrentUnitOfWork.SaveChanges();

            EventBus.Trigger(new OrderCreatedEventData(boughtContext.Order, boughtContext.ProductCount));
            return boughtContext.Order;
        }

        protected virtual void PreCreate(TBoughtContext boughtContext)
        {

        }

        protected virtual void PostCreate(TBoughtContext boughtContext)
        {
            if (boughtContext.Order.PayMoney > 0)
            {
                boughtContext.Order.OrderStatus = OrderStatus.UnPay;
            }
            else if(boughtContext.Order.IsNeedShip)
            {
                boughtContext.Order.OrderStatus = OrderStatus.UnShip;
            }
            else
            {
                boughtContext.Order.OrderStatus = OrderStatus.Completed;
            }
        }

        private void AssignTitle(TBoughtContext boughtContext)
        {
            boughtContext.Order.Title = BuildTitle(boughtContext);
        }

        protected virtual string BuildTitle(TBoughtContext boughtContext)
        {
            return L("DefaultTitle");
        }

        private void AssignNumber(TBoughtContext boughtContext)
        {
            boughtContext.Order.Number = BuildNumber(boughtContext);
        }

        protected string BuildNumber(TBoughtContext boughtContext)
        {
            return NumberProvider.BuildNumber();
        }

        protected void AssignScore(TBoughtContext boughtContext)
        {
            CaculateScore(boughtContext);
            boughtContext.Order.Score = boughtContext.Score;
        }

        protected virtual void CaculateScore(TBoughtContext boughtContext)
        {
            boughtContext.Score = 0;
        }

        protected virtual TBoughtContext PreProcessOrderData(TBoughtContext boughtContext)
        {
            return boughtContext;
        }

        protected virtual void CustomerAssgin(TBoughtContext boughtContext)
        {

        }

        protected virtual TBoughtContext AssignMoney(TBoughtContext boughtContext)
        {
            boughtContext.Order.Money = boughtContext.Money;
            boughtContext.Order.PayMoney = boughtContext.Money;
            return boughtContext;
        }
    }
}
