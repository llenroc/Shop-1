using Application.Channel.ChannelAgents;
using Application.Group.Dto;
using Infrastructure.AutoMapper;

namespace Application.Orders.Admins.ProductOrders.Dto
{
    [AutoMapFrom(typeof(ChannelAgentRebate))]
    public class ChannelAgentRebateDto
    {
        public decimal Money { get; set; }

        public CustomerDto User { get; set; }

        public int Depth { get; set; }
    }
}
