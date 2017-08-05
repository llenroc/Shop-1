using Application.Spread.Front.SpreadPosters.Dto;
using Application.SpreadPosters.Front.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.SpreadPosters.Front
{
    public interface ISpreadPosterAppService:IApplicationService
    {
        Task<QrcodeDto> GetQrcodeAsync();

        Task<SpreadPosterOutput> GetSpreadPosters();

        Task<string> GetDefatulSpreadPoster();

        Task<string> ReCreateDefaultSpreadPoster();

        Task<string> CreateSpreadPoster(IdInput input);
    }
}
