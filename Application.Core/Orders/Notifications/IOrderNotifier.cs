using Application.Orders.Entities;
using System.Threading.Tasks;

namespace Application.Orders.Notifications
{
    public interface IOrderNotifier
    {
        Task OrderPayed(Order order);
    }
}
