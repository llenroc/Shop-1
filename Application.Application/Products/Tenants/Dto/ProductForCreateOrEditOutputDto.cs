using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Products.Tenants.Dto
{
    [AutoMapFrom(typeof(Product))]
    public class ProductForCreateOrEditOutputDto:NullableIdDto
    {
        [Required]
        public string Name { get; set; }

        public string Content { get; set; }

        public int ShopId { get; set; }

        public int ProductCategoryId { get; set; }

        public int Score { get; set; }

        public bool Show { get; set; }

        public int ExchangeScore { get; set; }

        public int TemplateId { get; set; } = 1;

        public int? FreightTemplateId { get; set; }

        public ProductType Type { get; set; }

        public VirtualProductType VirtualProductType { get; set; }

        public string CardName { get; set; }

        public ProductStatus Status { get; set; }

        public bool EnableAgentOrder { get; set; }

        public bool IsRedirectExternal { get; set; }

        public string ExternalLink { get; set; }

        public string ShareTitle { get; set; }

        public string ShareDescription { get; set; }

        public string SharePicture { get; set; }

        public string MasterQrcode { get; set; }

        public List<SpecificationPropertyDto> SpecificationPropertys { get; set; }
    }
}
