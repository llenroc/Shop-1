using Infrastructure.Authorization.Users;
using Infrastructure.Dependency;
using Infrastructure.UI;
using System;

namespace Application.Authorization
{
    public class LoginResultTypeHelper : ApplicationServiceBase, ITransientDependency
    {
        public Exception CreateExceptionForFailedLoginAttempt(LoginResultType result, string usernameOrEmailAddress, string tenancyName)
        {
            switch (result)
            {
                case LoginResultType.Success:
                    return new ApplicationException("Don't call this method with a success result!");
                case LoginResultType.InvalidUserNameOrEmailAddress:
                case LoginResultType.InvalidPassword:
                    return new UserFriendlyException(L("LoginFailed"), L("InvalidUserNameOrPassword"));
                case LoginResultType.InvalidTenancyName:
                    return new UserFriendlyException(L("LoginFailed"), L("ThereIsNoTenantDefinedWithName{0}", tenancyName));
                case LoginResultType.TenantIsNotActive:
                    return new UserFriendlyException(L("LoginFailed"), L("TenantIsNotActive", tenancyName));
                case LoginResultType.UserIsNotActive:
                    return new UserFriendlyException(L("LoginFailed"), L("UserIsNotActiveAndCanNotLogin", usernameOrEmailAddress));
                case LoginResultType.UserEmailIsNotConfirmed:
                    return new UserFriendlyException(L("LoginFailed"), L("UserEmailIsNotConfirmedAndCanNotLogin"));
                default: //Can not fall to default actually. But other result types can be added in the future and we may forget to handle it
                    Logger.Warn("Unhandled login fail reason: " + result);
                    return new UserFriendlyException(L("LoginFailed"));

            }
        }
    }
}
