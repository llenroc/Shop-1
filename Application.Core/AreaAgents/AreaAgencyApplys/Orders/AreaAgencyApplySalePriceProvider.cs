using Application.Orders.SalePriceProviders;
using Application.Regions;
using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;
using System.Linq;

namespace Application.AreaAgents.AreaAgencyApplys.Orders
{
    public class AreaAgencyApplySalePriceProvider : ISalePriceProvider<AreaAgencyApplyBoughtContext>, ISingletonDependency
    {
        public IRepository<Address> AddressRepository { get; set; }

        public AreaAgencyApplyBoughtContext Caculate(AreaAgencyApplyBoughtContext boughtContext)
        {
            boughtContext.NormalAddressCount = AddressRepository.GetAll().Where(model => model.DevelopLevel == DevelopLevel.Normal && boughtContext.AddressIds.Contains(model.Id)).Count();
            boughtContext.DevelopedAddressCount= AddressRepository.GetAll().Where(model => model.DevelopLevel == DevelopLevel.Developed && boughtContext.AddressIds.Contains(model.Id)).Count();
            boughtContext.Money = boughtContext.NormalAddressCount*boughtContext.AreaAgent.Price* (decimal)boughtContext.AreaAgent.NormalAddressRatio
                + boughtContext.DevelopedAddressCount * boughtContext.AreaAgent.Price;
            return boughtContext;
        }
    }
}
