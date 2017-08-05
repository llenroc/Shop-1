using Application.Authorization.Users;
using Infrastructure.Configuration.Startup;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using Infrastructure.Runtime.Session;
using System.Linq;
using System.Security.Claims;
using System.Threading;

namespace Application.Runtime.Session
{
    public class ApplicationSession :ClaimsSession, IApplicationSession, IInfrastructureSession, ISingletonDependency
    {
        public IRepository<User,long> UserRepository { get; set; }

        private User _user { get; set; }

        public string EmailAddress => GetKeyValue(ClaimTypes.Email);

        public string Surname => GetKeyValue(ClaimTypes.Surname);

        public string Name => GetKeyValue(ClaimTypes.Name);

        public User User {
            get {

                if (_user == null&& UserId.HasValue)
                {
                    _user = UserRepository.Get(UserId.Value);
                }
                return _user;
            }
        }

        public ApplicationSession(IMultiTenancyConfig multiTenancy):base(multiTenancy)
        {
        }

        private string GetKeyValue(string key)
        {
            var claimsPrincipal = Thread.CurrentPrincipal as ClaimsPrincipal;

            if (claimsPrincipal == null)
            {
                return null;
            }

            Claim claim = claimsPrincipal.Claims.FirstOrDefault(c => c.Type == key);

            if (string.IsNullOrEmpty(claim?.Value))
            {
                return null;
            }
            return claim.Value;

        }
    }
}
