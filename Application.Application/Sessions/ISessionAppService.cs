using Application.Sessions.Dto;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Sessions
{
    public interface ISessionAppService : IApplicationService
    {
        CurrentLoginInformationsOutput GetCurrentLoginInformations();

        Task<ShopInformationsOutput> GetShopInformations();
    }
}
