using Infrastructure;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;

namespace Application.Authorization.Users
{
    public class UserLocationManager:ApplicationDomainServiceBase
    {
        public IRepository<UserLocation> UserLocationRepository { get; set; }
        public IRepository<User,long> UserRepository { get; set; }

        [UnitOfWork]
        public void AddUserLocation(UserIdentifier userIdentifier, double longitude, double latitude)
        {
            using (CurrentUnitOfWork.SetTenantId(userIdentifier.TenantId))
            {
                UserLocation userLocation = new UserLocation()
                {
                    UserId = userIdentifier.UserId,
                    Longitude = longitude,
                    Latitude = latitude
                };
                UserLocationRepository.Insert(userLocation);

                User user = UserRepository.Get(userIdentifier.UserId);
                user.LastLocation = new Location()
                {
                    Longitude = longitude,
                    Latitude = latitude
                };
                UserRepository.Update(user);
            }
        }
    }
}
