using Infrastructure.Authorization.Roles;
using Application.Authorization.Users;

namespace Application.Authorization.Roles
{
    public class Role : CommonFrameRole<User>
    {
        //Can add application specific role properties here

        public Role()
        {

        }

        public Role(int? tenantId, string displayName) : base(tenantId, displayName)
        {

        }

        public Role(int? tenantId, string name, string displayName) : base(tenantId, name, displayName)
        {

        }
    }
}