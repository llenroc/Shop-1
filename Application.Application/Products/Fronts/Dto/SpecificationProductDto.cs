using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.Products.Fronts.Dto
{
    [AutoMap(typeof(Product))]
    public class SpecificationProductDto : FullAuditedEntityDto
    {
        public string Name { get; set; }

        public string Content { get; set; }

        public int ShopId { get; set; }

        public int ProductCategoryId { get; set; }

        public int? TemplateId { get; set; }

        public int Sale { get; }

        public int Stock { get; }

        public ProductType Type { get; set; }

        public VirtualProductType VirtualProductType { get; set; }

        public string CardName { get; set; }

        public ProductStatus Status { get; set; }

        public bool IsRedirectExternal { get; set; }

        public string ExternalLink { get; set; }

        public string ShareTitle { get; set; }

        public string ShareDescription { get; set; }

        public string SharePicture { get; set; }
    }
}
