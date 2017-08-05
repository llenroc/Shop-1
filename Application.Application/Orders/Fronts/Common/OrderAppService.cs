using Application.Orders.Entities;
using Application.Orders.Fronts.Dto;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using Infrastructure.UI;

namespace Application.Orders.Fronts.Common
{
    public class OrderAppService : CrudAppService<
            Order,
            OrderDto,
            int,
            OrderGetAllInput,
            OrderDto,
            OrderDto, 
            OrderGetInput, 
            OrderGetInput>
        , IOrderAppService
    {
        protected IRepository<Order> OrderBaseRepository;

        public CommonOrderManager OrderManager { get; set; }
        
        public OrderAppService(IRepository<Order> repository): base(repository)
        {
            LocalizationSourceName = ApplicationConsts.LocalizationSourceName;
        }

        public PayOutput GetPayOutput(PayInput input)
        {
            OrderDto order = Get(new OrderGetInput()
            {
                Id=input.Id
            });

            if (order.PaymentStatus == PaymentStatus.Payed)
            {
                throw new UserFriendlyException(L("OrderHasPayed"));
            }
            PayOutput payOutput = new PayOutput()
            {
                Order = order
            };
            return payOutput;
        }
    }
}
