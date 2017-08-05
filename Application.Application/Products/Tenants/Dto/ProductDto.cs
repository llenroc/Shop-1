using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Products.Tenants.Dto
{
    [AutoMap(typeof(Product))]
    public class ProductDto:FullAuditedEntityDto
    {
        [Required]
        public string Name { get; set; }

        public string Content { get; set; }

        public int ShopId { get; set; }

        public bool Show { get; set; }

        public int ProductCategoryId { get; set; }

        public int Score { get; set; }

        public int ExchangeScore { get; set; }

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

        public List<ProductPropertyDto> Properties { get; set; }

        public List<SpecificationPropertyDto> SpecificationPropertys { get; set; }

        public List<SpecificationDto> Specifications { get; set; }

        public List<DistributionDto> Distributions { get; set; }

        public List<ChannelAgentProductDistributionDto> ChannelAgentProductDistributions { get; set; }

        public List<CustomCustomerInfoDto> CustomCustomerInfos { get; set; }
    }
}
