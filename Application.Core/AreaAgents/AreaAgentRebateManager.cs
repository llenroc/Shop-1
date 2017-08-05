using Application.Authorization.Users;
using Application.Entities;
using Application.Products.Orders.Entities;
using Application.Regions;
using Application.Wallets;
using Infrastructure.Domain.Repositories;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.AreaAgents
{
    public class AreaAgentRebateManager : ApplicationDomainServiceBase
    {
        public IRepository<User, long> UserRepository { get; set; }
        public IRepository<Address> AddressRepository { get; set; }
        public IRepository<AreaAgent> AreaAgentRepository { get; set; }
        public IRepository<AreaAgency> AreaAgencyRepository { get; set; }
        public IRepository<AreaAgencyArea> AreaAgencyAreaRepository { get; set; }
        public IRepository<AreaAgentRebate> AreaAgentRebateRepository { get; set; }
        public WalletManager WalletManager { get; set; }

        public decimal GetTotalRebateOfAreaAgency(int areaAgencyId)
        {
            return AreaAgentRebateRepository.GetAll().Where(model => model.AreaAgentId == areaAgencyId).Sum(model => (decimal?)model.Money) ?? 0;
        }

        public async Task<List<AreaAgentRebate>> TryAndCreateOrderAreaAgentRebate(ProductOrder order)
        {
            List<AreaAgency> areaAgencys = GetAreaAgencysFromOrder(order);
            List<AreaAgentRebate> areaAgentRebates = new List<AreaAgentRebate>();

            foreach (AreaAgency areaAgency in areaAgencys)
            {
                areaAgentRebates.Add(await CreateAreaAgentRebate(order, areaAgency, areaAgency.User, false));

                if (areaAgency.AreaAgent.IndirectRebateRatio > 0&& areaAgency.User.ParentUserId.HasValue)
                {
                    areaAgentRebates.Add(await CreateAreaAgentRebate(order, areaAgency, areaAgency.User.ParentUser, true));
                }
            }
            return areaAgentRebates;
        }

        private async Task<AreaAgentRebate> CreateAreaAgentRebate(ProductOrder order,AreaAgency areaAgency,User user,bool isIndirectRebate)
        {
            decimal money = order.Money * (decimal)areaAgency.AreaAgent.RebateRatio;
            string remark = L("AreaAgentRebate");

            if (isIndirectRebate)
            {
                money *= (decimal)areaAgency.AreaAgent.IndirectRebateRatio;
                remark = L("IndirectAreaAgentRebate");
            }
            AreaAgentRebate areaAgentRebate = new AreaAgentRebate()
            {
                OrderId = order.Id,
                UserId = user.Id,
                AreaAgentId = areaAgency.AreaAgentId,
                AreaAgencyId = areaAgency.Id,
                BuyerUserId = order.UserId,
                Money = money,
                IsIndirectRebate = isIndirectRebate,
                Remark= remark
            };
            AreaAgentRebateRepository.Insert(areaAgentRebate);
            await WalletManager.IncomeOfOrderRebateAsync(areaAgency.GetUserIdentifier(), areaAgentRebate.Money, remark, order);
            return areaAgentRebate;
        }

        public List<AreaAgency> GetAreaAgencysFromOrder(ProductOrder order)
        {
            List<AreaAgency> areaAgencys = new List<AreaAgency>();

            if (order.OrderCustomerInfo==null)
            {
                return areaAgencys;
            }
            Address currentAddress = order.OrderCustomerInfo.Address;

            do
            {
                AreaAgencyArea areaAgencyArea = GetAreaAgencyFromAddress(currentAddress);

                if (areaAgencyArea != null)
                {
                    areaAgencys.Add(areaAgencyArea.AreaAgency);
                }
                currentAddress = currentAddress.Parent;
            }
            while (currentAddress!=null);
            return areaAgencys;
        }

        private AreaAgencyArea GetAreaAgencyFromAddress(Address address)
        {
            AreaAgencyArea areaAgencyArea = AreaAgencyAreaRepository.GetAll().Where(model => model.AddressId == address.Id).FirstOrDefault();
            return areaAgencyArea;
        }
    }
}
