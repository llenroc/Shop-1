using Application.Authorization.Users;
using Application.Customers;
using Application.Expresses;
using Application.Products;
using Application.Products.Orders;
using Application.Scores.Orders.Entities;
using Infrastructure.Domain.Repositories;
using Infrastructure.Runtime.Session;
using System;
using System.Threading.Tasks;

namespace Application.Scores.Orders
{
    public class ScoreExchangeOrderCreator : ProductOrderCreator<ScoreExchangeOrder, ScoreExchangeBoughtContext>
    {
        public ScoreManager ScoreManager { get; set; }

        public ScoreExchangeOrderCreator(
            IRepository<Product> productRepository,
            IRepository<Specification> specificationRepository,
            IRepository<ScoreExchangeOrder> orderRepository,
            IRepository<ExpressCompany> expressCompanyRepository,
            IRepository<User, long> userRepository,
            IRepository<CustomerInfo> customerInfoRespository,
            ScoreExchangeSalePriceProvider salePriceProvider
            )
            : base(
                 productRepository,
                 specificationRepository,
                 orderRepository,
                 expressCompanyRepository,
                 userRepository,
                 customerInfoRespository,
                 salePriceProvider
                 )
        {
        }

        public override async Task<bool> CheckBuyPermissionAsync()
        {
            return await Task.FromResult<bool>(true);
        }

        protected override void CaculateScore(ScoreExchangeBoughtContext boughtContext)
        {
        }

        protected override void ComputeChannelAgentRebate(ScoreExchangeBoughtContext boughtContext)
        {
            boughtContext.ChannelAgentRebate = 0;
        }

        protected void CaculateExchangeScore(ScoreExchangeBoughtContext boughtContext)
        {
            foreach (BoughtItem boughtItem in boughtContext.BoughtItems)
            {
                boughtContext.ExchangeScore += boughtItem.Specification.Product.ExchangeScore;
            }
        }

        protected override void PreCreate(ScoreExchangeBoughtContext boughtContext)
        {
            base.PreCreate(boughtContext);
            CaculateExchangeScore(boughtContext);
            Score score=ScoreManager.GetScore(InfrastructureSession.ToUserIdentifier());

            if(score.Total< boughtContext.ExchangeScore)
            {
                throw new Exception(L("ScoreIsNotEnoughtForExchange"));
            }
        }

        protected override void CustomerAssgin(ScoreExchangeBoughtContext boughtContext)
        {
            base.CustomerAssgin(boughtContext);
            boughtContext.Order.ExchangeScore = boughtContext.ExchangeScore;
        }
    }
}
