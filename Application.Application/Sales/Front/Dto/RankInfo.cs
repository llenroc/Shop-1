using Infrastructure.Application.DTO;

namespace Application.Sales.Front.Dto
{
    public class RankInfo:PagedResultDto<UserForRankDto>
    {
        public int MyRank { get; set; }
    }
}
