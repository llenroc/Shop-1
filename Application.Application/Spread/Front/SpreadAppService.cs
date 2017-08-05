using Application.Spread.Shares;
using Application.Spread.SpreadPosters;
using Application.Wechats.Qrcodes;
using Infrastructure.Domain.Repositories;
using Infrastructure.Runtime.Session;
using System.Threading.Tasks;

namespace Application.Spread.Front
{
    public class SpreadAppService:ApplicationAppServiceBase, ISpreadAppService
    {
        public SpreadPosterManager SpreadPosterManager { get; set; }
        public QrcodeManager QrcodeManager { get; set; }
        private IRepository<Share> ShareRepository;

        public SpreadAppService(IRepository<Share> shareRepository)
        {
            ShareRepository = shareRepository;
        }

        public async Task<string> GetQrcode()
        {
            Qrcode qrcode = await QrcodeManager.GetQrcodeAsync(InfrastructureSession.ToUserIdentifier());
            return qrcode.Path;
        }

        public async Task<string> ReCreateQrcode()
        {
            Qrcode qrcode = await QrcodeManager.ReCreateQrcodeAsync(InfrastructureSession.ToUserIdentifier());
            return qrcode.Path;
        }
    }
}
