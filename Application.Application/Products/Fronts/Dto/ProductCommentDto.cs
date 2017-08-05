using Application.Authorization.Front.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Products.Fronts.Dto
{
    [AutoMap(typeof(ProductComment))]
    public class ProductCommentDto:AuditedEntityDto
    {
        public int ProductId { get; set; }

        public int OrderId { get; set; }

        public int OrderItemId { get; set; }

        public string Content { get; set; }

        public CommonUserForProfileDto CreatorUser { get; set; }
    }
}
