using Application.Authorization.Users;
using Application.Sales.Events;
using Infrastructure.Domain.Repositories;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Sales
{
    public class SalesManager : ApplicationDomainServiceBase
    {
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

        public async Task RankAsync()
        {
            int rank = 1;
            var salesGroupQuery = from user in _userRepository.GetAll()
                                  group user by user.Sales into userGroup orderby userGroup.Key
                                  select userGroup;
            var salesGroup = salesGroupQuery.ToList();

            foreach (var salesGroupItem in salesGroup)
            {
               var users= _userRepository.GetAll().Where(model => model.Sales == salesGroupItem.Key);

                foreach(User user in users)
                {
                    user.Rank = rank;
                }
                rank++;
            }
            await CurrentUnitOfWork.SaveChangesAsync();
        }
    }
}
