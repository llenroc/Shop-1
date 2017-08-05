using Application.VirtualProducts.VirtualCards.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.VirtualProducts.VirtualCards.End
{
    public interface IVirtualCardAppService : ICrudAppService<VirtualCardDto, int, VirtualCardGetAllInput>
    {
        PagedResultDto<VirtualCardGroupOutput> GetVirtualCardGroups(VirtualCardGroupGetAllInput input);

        Task ImportVirtualCard(VirtualCardImportInput input);
    }
}
