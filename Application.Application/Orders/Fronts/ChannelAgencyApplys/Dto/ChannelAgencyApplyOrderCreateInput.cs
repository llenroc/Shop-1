using Application.Authorization.Front.Dto;

namespace Application.Orders.Fronts.ChannelAgencyApplys.Dto
{
    public class ChannelAgencyApplyOrderCreateInput
    {
        public int ChannelAgentId { get; set; }

        public int? CustomerInfoId { get; set; }

        public UserDetailUpdateInput UserDetail { get; set; }
    }
}
