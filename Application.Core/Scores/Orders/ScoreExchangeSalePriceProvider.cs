using Application.Orders.SalePriceProviders;
using Infrastructure.Dependency;

namespace Application.Scores.Orders
{
    public class ScoreExchangeSalePriceProvider : ISalePriceProvider<ScoreExchangeBoughtContext>, ISingletonDependency
    {
        public ScoreExchangeBoughtContext Caculate(ScoreExchangeBoughtContext boughtContext)
        {
            boughtContext.Money = 0;
            return boughtContext;
        }
    }
}
