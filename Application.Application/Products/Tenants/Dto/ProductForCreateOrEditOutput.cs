using Application.ProductCategorys.Tenants.Dto;
using System.Collections.Generic;

namespace Application.Products.Tenants.Dto
{
    public class ProductForCreateOrEditOutput
    {
        public List<ProductCategoryDto> ProductCategorys { get; set; }

        public List<SpecificationPropertyDto> SpecificationPropertys { get; set; }

        public ProductForCreateOrEditOutputDto Product { get; set; }

        public List<DistributionDto> Distributions { get; set; }

        public List<ChannelAgentProductDistributionDto> ChannelAgentProductDistributions { get; set; }

        public List<ProductPropertyCreateOrEditDto> Properties { get; set; }

        public List<ProductUnitCreateOrEditDto> ProductUnits { get; set; }

        public List<CustomCustomerInfoDto> CustomCustomerInfos { get; set; }

        public List<SpecificationDto> Specifications { get; set; }
    }
}
