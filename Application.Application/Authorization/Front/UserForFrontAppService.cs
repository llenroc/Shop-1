using Application.Authorization.Front.Dto;
using Application.Authorization.Users;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Linq;

namespace Application.Authorization.Front
{
    public class UserForFrontAppService:
        ApplicationDomainServiceBase,
        IUserForFrontAppService
    {
        public UserManager UserManager { get; set; }
        private IRepository<User, long> _userRepository;
        public IRepository<UserDetail> UserDetailRepository { get; set; }
        public AuthorizationHelper AuthorizationHelper { get; set; }

        public UserForFrontAppService(IRepository<User, long> userRepository)
        {
            _userRepository = userRepository;
        }

        public UserDetailForEditDto GetUserDetailForEdit()
        {
            UserDetailForEditDto userDetailForEditDto = new UserDetailForEditDto();

            if (AuthorizationHelper.CurrentUser.UserDetail != null)
            {
                userDetailForEditDto = AuthorizationHelper.CurrentUser.UserDetail.MapTo<UserDetailForEditDto>();
            }
            return userDetailForEditDto;
        }

        public void CreateOrEditUserDetail(UserDetailForEditDto input)
        {
            if (input.Id.HasValue)
            {
                var entity = UserDetailRepository.Get(input.Id.Value);
                ObjectMapper.Map(input, entity);
                CurrentUnitOfWork.SaveChanges();
            }
            else
            {
                var entity = input.MapTo<UserDetail>();
                entity.User = AuthorizationHelper.CurrentUser;
                UserDetailRepository.Insert(entity);
                CurrentUnitOfWork.SaveChanges();
            }
        }

        public CommonUserForProfileDto GetMyParent()
        {
            User user = _userRepository.Get(InfrastructureSession.UserId.Value);
            CommonUserForProfileDto parentUser = user.ParentUser.MapTo<CommonUserForProfileDto>();
            return parentUser;
        }
    }
}
