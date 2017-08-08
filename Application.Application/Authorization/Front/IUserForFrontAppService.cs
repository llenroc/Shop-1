using Application.Authorization.Front.Dto;
using Infrastructure.Application.Services;

namespace Application.Authorization.Front
{
    public interface IUserForFrontAppService:IApplicationService
    {
        CommonUserForProfileDto GetMyParent();
        UserDetailForEditDto GetUserDetailForEdit();
        void CreateOrEditUserDetail(UserDetailForEditDto input);
    }
}