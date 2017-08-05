using Application.Orders.Entities;
using Infrastructure.Dependency;

namespace Application.Orders.BoughtContexts
{
    public class BoughtContext : BoughtContext<Order>
    {
        public Order Order { get; set; }

        public decimal Money { get; set; } = 0;

        public int Score { get; set; }

        public int ProductCount
        {
            get
            {
                return 0;
            }
        }
    }

    public class BoughtContext<TOrder> : IBoughtContext<TOrder>, ISingletonDependency
    {
        public TOrder Order { get; set; }

        public decimal Money { get; set; } = 0;

        public int Score { get; set; }

        public int ProductCount
        {
            get
            {
                return 0;
            }
        }
    }
}
