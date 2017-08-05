using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Products.Fronts.Dto
{
    [AutoMapFrom(typeof(Product))]
    public class ProductForOrderListDto:EntityDto
    {
        public string Name { get; set; }

        public string Content { get; set; }

        public int ShopId { get; set; }

        public int ProductCategoryId { get; set; }

        public string Price { get; set; }

        public int Sale { get; }

        public int Stock { get; }

        public ProductType Type { get; set; }

        public ProductStatus Status { get; set; }

        public bool IsRedirectExternal { get; set; }

        public string ExternalLink { get; set; }
    }
}
