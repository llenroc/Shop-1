using Application.Entities;

namespace Application.Authorization.Users
{
    public class UserLocation: FullAuditedUserIdentifierEntity
    {
        public double Longitude { get; set; }

        public double Latitude { get; set; }
    }
}
