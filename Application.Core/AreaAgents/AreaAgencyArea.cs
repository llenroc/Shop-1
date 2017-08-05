using Application.Entities;
using Application.Regions;
using System.ComponentModel.DataAnnotations.Schema;
using Infrastructure.Domain.Entities.Auditing;

namespace Application.AreaAgents
{
    public class AreaAgencyArea:AuditedEntity, IUserIdentifierEntity
    {
        public int TenantId { get; set; }

        public long UserId { get; set; }

        public int AreaAgencyId { get; set; }

        public virtual AreaAgency AreaAgency { get; set; }

        [Index(IsUnique = true)]
        public int AddressId { get; set; }

        public DevelopLevel DevelopLevel { get; set; }

        public int Level { get; set; }

        public int AreaAgentId { get; set; }

        public string ProvinceName { get; set; }

        public virtual Address Address { get; set; }
    }
}
