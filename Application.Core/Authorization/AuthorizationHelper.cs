using Application.Authorization.Users;
using Infrastructure.Domain.Repositories;
using Infrastructure.Runtime.Session;
using Infrastructure.Dependency;

namespace Application.Authorization
{
    public class AuthorizationHelper:ITransientDependency
    {
        public IInfrastructureSession InfrastructureSession { get; set; }
        public IRepository<User,long> UserRepository { get; set; }

        private User _currentUser = null;

        public User CurrentUser
        {
            get
            {
                if (_currentUser == null&& InfrastructureSession.UserId.HasValue)
                {
                    _currentUser=UserRepository.Get(InfrastructureSession.UserId.Value);
                }
                return _currentUser;
            }
        }
    }
}
