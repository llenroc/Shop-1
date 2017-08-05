using Application.Regions.Common.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.AreaAgents.End.Dto
{
    [AutoMap(typeof(AreaAgencyArea))]
    public class AreaAgencyAreaDto : AuditedEntityDto
    {
        public CommonAddressDto Address { get; set; }
    }
}
