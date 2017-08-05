using Application.Authorization.Users;
using Application.Orders.BoughtContexts;
using Application.Orders.Entities;
using Infrastructure.Domain.Repositories;

namespace Application.Orders
{
    public class CommonOrderManager : OrderManager<Order, BoughtContext>
    {
        public CommonOrderManager(
            IRepository<Order> orderRepository,
            IRepository<User, long> userRepository
            ) : base(orderRepository, 
                userRepository)
        {

        }

        protected override void PreCloseOrder(Order order)
        {
        }

        public override Order Receive(Order order)
        {
            return order;
        }

        public override Order CompleteShip(Order order, ExpressInfo expreeInfo = null)
        {
            return order;
        }
    }
}
