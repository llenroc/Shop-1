using Application.UserLoginAttempts.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.Authorization.Users;

namespace Application.UserLoginAttempts
{
    public interface IUserLoginAttemptsAppService : ICrudAppService<UserLoginAttemptDto, long>
    {
    }
}
