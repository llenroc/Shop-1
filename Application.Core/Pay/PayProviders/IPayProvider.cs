using Application.Orders.Entities;
using System.Threading.Tasks;

namespace Application.Pay.PayProviders
{
    public interface IPayProvider
    {
        Task Refund(Order order, decimal refundFee);
    }
}
