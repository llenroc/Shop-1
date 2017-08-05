using Infrastructure.Application.DTO;

namespace Application.AreaAgents.End.Dto
{
    public class AreaAgencyGetAllInput: PagedAndSortedResultRequestDto
    {
        public int? AreaAgentId { get; set; }
        public string FullName { get; set; }
        public string PhoneNumber { get; set; }
        public string WechatName { get; set; }
        public string IdentityNumber { get; set; }
    }
}
