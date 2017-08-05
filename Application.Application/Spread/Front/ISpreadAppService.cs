using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Spread.Front
{
    public interface ISpreadAppService:IApplicationService
    {
        Task<string> GetQrcode();

        Task<string> ReCreateQrcode();
    }
}
