using Application.Authorization.Front.Dto;

namespace Application.Orders.Fronts.AreaAgencyApplys.Dto
{
    public class AreaAgencyApplyOrderCreateInput
    {
        public int AreaAgentId { get; set; }

        public int[] AddressIds { get; set; }

        public UserDetailUpdateInput UserDetail { get; set; }
    }
}
