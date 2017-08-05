using System.Collections.Generic;

namespace Application.Tenants.Dashboard.Dto
{
    public class OrderActivityOutput
    {
        public List<CommonDateCount> NewPayedOrders { get; set; }
    }
}