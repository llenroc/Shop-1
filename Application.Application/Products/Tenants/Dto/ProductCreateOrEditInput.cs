using System.Collections.Generic;

namespace Application.Products.Tenants.Dto
{
    public class ProductCreateOrEditInput
    {
        public ProductCreateOrEditInputDto Product { get; set; }

        public List<DistributionCreateOrEditInput> Distributions { get; set; }

        public List<ChannelAgentProductDistributionCreateOrEditInput> ChannelAgentProductDistributions { get; set; }

        public List<ProductPropertyCreateOrEditDto> Properties { get; set; }

        public List<ProductUnitCreateOrEditDto> ProductUnits { get; set; }

        public List<CustomCustomerInfoCreateOrEditInput> CustomCustomerInfos { get; set; }

        public List<SpecificationForCreateOrEditInput> Specifications { get; set; }
    }
}
