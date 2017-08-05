using Application.Agents;
using Application.AreaAgents.AreaAgencyApplys;
using Application.Group.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.Collections.Generic;

namespace Application.AreaAgents.End.Dto
{
    [AutoMap(typeof(AreaAgencyApply))]
    public class AreaAgencyApplyDto : FullAuditedEntityDto
    {
        public int AreaAgentId { get; set; }

        public int OrderId { get; set; }

        public AreaAgentDto AreaAgent { get; set; }

        public AgencyApplyStatus Status { get; set; }

        public string FullName { get; set; }

        public string WechatName { get; set; }

        public string IdentityNumber { get; set; }

        public string PhoneNumber { get; set; }

        public CustomerDto User { get; set; }

        public List<AreaAgencyApplyAddressDto> AreaAgencyApplyAddresses { get; set; }
    }
}
