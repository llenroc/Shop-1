using Application.AreaAgents.AreaAgencyApplys;
using Application.Regions.Common.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.AreaAgents.End.Dto
{
    [AutoMap(typeof(AreaAgencyApplyAddress))]
    public class AreaAgencyApplyAddressDto : EntityDto
    {
        public int AddressId { get; set; }

        public virtual AddressDto Address { get; set; }

        public int AreaAgencyApplyId { get; set; }
    }
}
