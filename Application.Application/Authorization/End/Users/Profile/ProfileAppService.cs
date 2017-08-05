using Application.Authorization.End.Users.Profile.Dto;
using Application.Authorization.Users;
using Application.Configuration;
using Application.Security;
using Infrastructure.Authorization;
using Infrastructure.Domain.Repositories;
using Infrastructure.UI;
using Newtonsoft.Json;
using System.Threading.Tasks;

namespace Application.Authorization.End.Users.Profile
{
    [InfrastructureAuthorize]
    public class ProfileAppService : ApplicationAppServiceBase, IProfileAppService
    {
        private readonly IAppFolders _appFolders;
        private IRepository<User, long> _userRepository;

        public ProfileAppService(
            IAppFolders appFolders,
            IRepository<User, long> userRepository)
        {
            _appFolders = appFolders;
            _userRepository = userRepository;
        }

        public async Task ChangePassword(ChangePasswordInput input)
        {
            await CheckPasswordComplexity(input.NewPassword);

            var user = await GetCurrentUserAsync();
            CheckErrors(await UserManager.ChangePasswordAsync(user.Id, input.CurrentPassword, input.NewPassword));
        }

        public async Task UpdateUser(UserUpdateInput input)
        {
            User user =await _userRepository.FirstOrDefaultAsync(InfrastructureSession.UserId.Value);
            ObjectMapper.Map(input, user);
            CurrentUnitOfWork.SaveChanges();
        }

        public async Task<GetPasswordComplexitySettingOutput> GetPasswordComplexitySetting()
        {
            var settingValue = await SettingManager.GetSettingValueAsync(AppSettings.Security.PasswordComplexity);
            var setting = JsonConvert.DeserializeObject<PasswordComplexitySetting>(settingValue);

            return new GetPasswordComplexitySettingOutput
            {
                Setting = setting
            };
        }

        private async Task CheckPasswordComplexity(string password)
        {
            var passwordComplexitySettingValue = await SettingManager.GetSettingValueAsync(AppSettings.Security.PasswordComplexity);
            var passwordComplexitySetting = JsonConvert.DeserializeObject<PasswordComplexitySetting>(passwordComplexitySettingValue);
            var passwordComplexityChecker = new PasswordComplexityChecker();
            var passwordValid = passwordComplexityChecker.Check(passwordComplexitySetting, password);

            if (!passwordValid)
            {
                throw new UserFriendlyException(L("PasswordComplexityNotSatisfied"));
            }
        }
    }
}
