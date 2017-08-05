using Application.Entities;

namespace Application.Agents
{
    public enum AgencyApplyStatus
    {
        Applying,
        Success,
        Fail,
        Cancel
    }


    public class AgencyApplyBase : FullAuditedUserIdentifierEntity
    {
        public AgencyApplyStatus Status { get; set; }
    }
}
