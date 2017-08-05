using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.ProductCategorys.Tenants.Dto
{
    [AutoMap(typeof(ProductCategory))]
    public class ProductCategoryCreateOrEditDto
    {
        public int? Id { get; set; }

        public string Name { get; set; }

        public string Icon { get; set; }

        public int? ParentId { get; set; }
    }
}
