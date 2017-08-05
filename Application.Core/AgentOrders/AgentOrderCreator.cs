using Application.AgentOrders.Entities;
using Application.Authorization.Users;
using Application.Customers;
using Application.Expresses;
using Application.Products;
using Application.Products.Orders;
using Infrastructure.Domain.Repositories;
using Infrastructure.UI;
using System.Threading.Tasks;

namespace Application.AgentOrders
{
    public class AgentOrderCreator :ProductOrderCreator<AgentOrder, AgentOrderBoughtContext>
    {
        public AgentOrderCreator(
            IRepository<Product> productRepository,
            IRepository<Specification> specificationRepository,
            IRepository<AgentOrder> orderRepository,
            IRepository<ExpressCompany> expressCompanyRepository,
            IRepository<User, long> userRepository,
            IRepository<CustomerInfo> customerInfoRespository,
            AgentOrderSalePriceProvider productSalePriceProvider
            ) : base(
                productRepository,
                 specificationRepository,
                 orderRepository,
                 expressCompanyRepository,
                 userRepository,
                 customerInfoRespository,
                 productSalePriceProvider)
        {
        }

        public override async Task<bool> CheckBuyPermissionAsync()
        {
            User user = UserRepository.Get(InfrastructureSession.UserId.Value);

            if (!user.IsAreaAgency && !user.IsChannelAgency)
            {
                throw new UserFriendlyException(L("YouAreNoteAgent"));
            }
            return await Task.FromResult(true);
        }

        protected override void ComputeChannelAgentRebate(AgentOrderBoughtContext boughtContext)
        {
            boughtContext.ChannelAgentRebate = 0;
        }

        protected override string BuildTitle(AgentOrderBoughtContext boughtContext)
        {
            return L("AgentOrder");
        }
    }
}
