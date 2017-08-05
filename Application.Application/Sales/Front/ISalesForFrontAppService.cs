using Application.Sales.Front.Dto;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Sales.Front
{
    public interface ISalesForFrontAppService:IApplicationService
    {
        RankInfo GetRankInfo();

        Task ComputeRanks();
    }
}