using Application.Authorization.Front.Dto;
using Application.Authorization.Users;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;

namespace Application.Authorization.Front
{
    public class UserForFrontAppService:ApplicationDomainServiceBase, IUserForFrontAppService
    {
        public UserManager UserManager { get; set; }
        private IRepository<User, long> UserRepository;
        
        public UserForFrontAppService(IRepository<User, long> userRepository)
        {
            UserRepository = userRepository;
        }

        public CommonUserForProfileDto GetMyParent()
        {
            User user = UserRepository.Get(InfrastructureSession.UserId.Value);
            CommonUserForProfileDto parentUser = user.ParentUser.MapTo<CommonUserForProfileDto>();
            return parentUser;
        }
    }
}
