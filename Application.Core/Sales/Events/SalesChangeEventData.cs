using Application.Authorization.Users;
using Infrastructure.Event.Bus;

namespace Application.Sales.Events
{
    public class SalesChangeEventData : EventData
    {
        public User User { get; set; }
        public decimal Sales { get; set; }

        public SalesChangeEventData(User user,decimal sales)
        {
            User = user;
            Sales = sales;
        }
    }
}
