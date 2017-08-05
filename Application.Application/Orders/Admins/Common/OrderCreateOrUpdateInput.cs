using Application.Orders.Entities;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Orders.Admins.Dto
{
    [AutoMapTo(typeof(Order))]
    public class OrderCreateOrUpdateInput:EntityDto
    {
        public string Number { get; set; }

        public string Title { get; set; }

        public decimal Money { get; set; }

        public long UserId { get; set; }

        public PaymentStatus PaymentStatus { get; set; }

        public RefundStatus RefundStatus { get; set; }
    }
}
