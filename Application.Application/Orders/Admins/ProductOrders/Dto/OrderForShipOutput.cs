using Application.Expresses.Dto;
using System.Collections.Generic;

namespace Application.Orders.Admins.ProductOrders.Dto
{
    public class OrderForShipOutput
    {
        public ProductOrderDto Order { get; set; }

        public List<ExpressCompanyDto> ExpressCompanys { get; set; }
    }
}
