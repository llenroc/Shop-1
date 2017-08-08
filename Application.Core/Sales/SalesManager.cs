using Application.Authorization.Users;
using Application.MultiTenancy;
using Application.Sales.Events;
using Infrastructure.Domain.Repositories;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Sales
{
    public class SalesManager : ApplicationDomainServiceBase
    {
        public TenantManager TenantManager { get; set; }
        private IRepository<User, long> _userRepository;

        public SalesManager(IRepository<User, long> userRepository)
        {
            _userRepository = userRepository;
        }

        public User IncreaseSales(long userId, decimal money)
        {
            User user = _userRepository.Get(userId);
            return IncreaseSales(user,money);
        }

        public User IncreaseSales(User user, decimal money)
        {
            if (money == 0)
            {
                return user;
            }
            user.Sales += money;
            _userRepository.Update(user);
            _unitOfWorkManager.Current.SaveChanges();

            EventBus.Trigger(new SalesChangeEventData(user,money));
            return user;
        }

        public class SalesGroup
        {
            public decimal Sales { get; set; }
        }

        public async Task RankAsync()
        {
            var tenants = TenantManager.Tenants.ToList();

            foreach(Tenant tenant in tenants)
            {
                using (CurrentUnitOfWork.SetTenantId(tenant.Id))
                {
                    int rank = 1;
                    var salesGroupQuery = from user in _userRepository.GetAll()
                                          group user by user.Sales into userGroup
                                          orderby userGroup.Key descending
                                          select userGroup;
                    var salesGroups = salesGroupQuery.ToList();

                    foreach (var salesGroupItem in salesGroups)
                    {
                        var usersQuery = _userRepository.GetAll().Where(model => model.Sales == salesGroupItem.Key);

                        foreach (User user in usersQuery.ToList())
                        {
                            user.Rank = rank;
                            _userRepository.Update(user);
                        }
                        rank++;
                    }
                    await CurrentUnitOfWork.SaveChangesAsync();
                }
            }
        }
    }
}
