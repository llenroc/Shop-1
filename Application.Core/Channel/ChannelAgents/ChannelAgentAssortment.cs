using Application.Products;
using Infrastructure.Domain.Entities;

namespace Application.Channel.ChannelAgents
{
    public class ChannelAgentAssortment : Entity
    {
        public int ChannelAgentId { get; set; }

        public virtual Specification Specification { get; set; }

        public int SpecificationId { get; set; }

        public int Count { get; set; }
    }
}
