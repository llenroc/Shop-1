using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.ShopCarts.Fronts.Dto
{
    [AutoMapTo(typeof(ShopCartItem))]
    public class ShopCartAddInput
    {
        public int ProductId { get; set; }

        public int SpecificationId { get; set; }

        public int Count { get; set; }
    }
}
