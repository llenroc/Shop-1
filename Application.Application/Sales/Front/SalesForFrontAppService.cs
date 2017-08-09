using Application.Authorization.Users;
using Application.Sales.Front.Dto;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Sales.Front
{
    public class SalesForFrontAppService:ApplicationDomainServiceBase, 
        ISalesForFrontAppService
    {
        public UserManager UserManager { get; set; }
        public SalesManager SalesManager { get; set; }
        private IRepository<User, long> UserRepository;

        public SalesForFrontAppService(IRepository<User, long> userRepository)
        {
            UserRepository = userRepository;
        }

        public RankInfo GetRankInfo()
        {
            RankInfo RankInfo = new RankInfo()
            {
                MyRank = UserManager.GetRankOfUser(InfrastructureSession.UserId.Value),
                PageIndex = 1,
            };
            RankInfo.Items = UserRepository.GetAll().Where(model => model.IsHide == false).Take(100).OrderBy(model => model.Rank)
            .MapTo<List<UserForRankDto>>();
            return RankInfo;
        }

        public async Task ComputeRanks()
        {
            SalesManager.Rank();
        }
    }
}
