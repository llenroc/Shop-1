using Infrastructure.Domain.Entities.Auditing;

namespace Application.UnifiedAgents.Entities
{
    public class UnifiedAgent:FullAuditedEntity
    {
        public string Name { get; set; }
        public int Level { get; set; }
        public bool? IsSpreader { get; set; }
        public bool? IsChannelAgency { get; set; }
        public bool? IsAreaAgency { get; set; }
        public int? ChannelAgentId { get; set; }
        public int? AreaAgentId { get; set; }
    }
}
