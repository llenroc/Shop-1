using Application.AreaAgents.AreaAgencyApplys.Orders.Entities;
using Application.Authorization.Users;
using Application.Customers;
using Application.Orders;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using System.Threading.Tasks;

namespace Application.AreaAgents.AreaAgencyApplys.Orders
{
    public class AreaAgencyApplyOrderCreator : OrderCreator<AreaAgencyApplyOrder, AreaAgencyApplyBoughtContext>
    {
        public AreaAgencyManager AreaAgencyManager { get; set; }
        protected IRepository<AreaAgencyApply> AreaAgencyApplyRepository;
        public IRepository<CustomerInfo> CustomerInfoRespository;
        public AreaAgencyApplyManager AreaAgencyApplyManager { get; set; }

        public AreaAgencyApplyOrderCreator(
            IRepository<AreaAgencyApply> channelAgencyApplyRepository,
            IRepository<AreaAgencyApplyOrder> orderRepository,
            IRepository<User, long> userRepository,
            IRepository<CustomerInfo> customerInfoRespository,
            AreaAgencyApplySalePriceProvider salePriceProvider
            ) : base(orderRepository, userRepository, salePriceProvider)
        {
            AreaAgencyApplyRepository = channelAgencyApplyRepository;
            CustomerInfoRespository = customerInfoRespository;
        }

        protected override string BuildTitle(AreaAgencyApplyBoughtContext boughtContext)
        {
            return boughtContext.AreaAgent.Name + L("Apply");
        }

        protected override AreaAgencyApplyBoughtContext PreProcessOrderData(AreaAgencyApplyBoughtContext boughtContext)
        {
            return base.PreProcessOrderData(boughtContext);
        }

        protected override void CustomerAssgin(AreaAgencyApplyBoughtContext boughtContext)
        {
        }

        [UnitOfWork]
        public override async Task<AreaAgencyApplyOrder> CreateOrder(AreaAgencyApplyBoughtContext boughtContext)
        {
            AreaAgencyApplyOrder order = await base.CreateOrder(boughtContext);
            AreaAgencyApplyManager.CreateAreaAgencyApply(boughtContext.AreaAgent.Id, boughtContext.Order.UserId, boughtContext.Order.Id,boughtContext.AddressIds);
            return order;
        }
    }
}
