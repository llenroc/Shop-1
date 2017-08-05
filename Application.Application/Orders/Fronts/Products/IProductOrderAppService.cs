using Application.Orders.Fronts.Dto;
using Application.Orders.Fronts.Products.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Application.Orders.Fronts.Products
{
    public interface IProductOrderAppService : ICrudAppService<
        ProductOrderDto,
        int,
        OrderGetAllInput,
        ProductOrderDto,
        ProductOrderDto, 
        OrderGetInput, 
        OrderGetInput>
    {
        OrderForCommentDto GetOrderForComment(IdInput input);

        OrderItemWithCommentDto Comment(CommentInput input);

        List<BoughtItemOutput> GetBoughtItemsFromShopCart();

        OrderConfirmOutput ConfirmOrder(OrderConfirmInput input);

        Task<ProductOrderDto> CreateOrder(OrderCreateInput input);

        ProductOrderDto Receive(IdInput input);

        void CloseOrder(IdInput input);
    }
}
