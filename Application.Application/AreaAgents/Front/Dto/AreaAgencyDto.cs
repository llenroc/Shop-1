using Application.Group.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.AreaAgents.Front.Dto
{
    [AutoMap(typeof(AreaAgency))]
    public class AreaAgencyDto:FullAuditedEntityDto
    {
        public int AreaAgentId { get; set; }

        public AreaAgentDto AreaAgent { get; set; }

        public CustomerDto User { get; set; }

        public string FullName { get; set; }

        public string WechatName { get; set; }

        public string IdentityNumber { get; set; }

        public string PhoneNumber { get; set; }
    }
}
