using Infrastructure.MultiTenancy;
using Application.Authorization.Users;

namespace Application.MultiTenancy
{
    public class Tenant : CommonFrameTenant<User>
    {
        public Tenant()
        {
            
        }

        public Tenant(string tenancyName, string name): base(tenancyName, name)
        {
        }
    }
}