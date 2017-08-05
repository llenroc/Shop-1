using Infrastructure.Domain.Entities.Auditing;
using Infrastructure.Domain.Entities;
using System.Collections.Generic;

namespace Application.BuyerShows
{
    public class BuyerShow:FullAuditedEntity,IMustHaveTenant
    {
        public int TenantId { get; set; }

        public int AreaAgencyApplyId { get; set; }

        public string Title { get; set; }

        public string Content { get; set; }

        public virtual ICollection<BuyerShowFile> Pictures { get; set; }
    }
}
