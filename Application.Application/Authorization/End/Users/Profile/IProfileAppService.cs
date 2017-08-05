using Application.Authorization.End.Users.Profile.Dto;
using Infrastructure.Application.Services;
using System.Threading.Tasks;

namespace Application.Authorization.End.Users.Profile
{
    public interface IProfileAppService : IApplicationService
    {
        Task UpdateUser(UserUpdateInput input);

        Task ChangePassword(ChangePasswordInput input);

        Task<GetPasswordComplexitySettingOutput> GetPasswordComplexitySetting();
    }
}
