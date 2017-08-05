using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Products.Fronts.Dto
{
    [AutoMapFrom(typeof(Product))]
    public class ProductListDto : EntityDto
    {
        public string Name { get; set; }

        public string Price { get; set; }

        public int Score { get; set; }

        public int ExchangeScore { get; set; }

        public int Sale { get; set; }

        public int Stock { get; set; }

        public ProductStatus Status { get; set; }

        public bool IsRedirectExternal { get; set; }

        public string ExternalLink { get; set; }

        public string Picture { get; set; }
    }
}
