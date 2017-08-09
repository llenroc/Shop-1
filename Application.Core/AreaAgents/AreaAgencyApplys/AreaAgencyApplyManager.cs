using Application.Agents;
using Application.Authorization.Users;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using System.Collections.Generic;
using System.Linq;

namespace Application.AreaAgents.AreaAgencyApplys
{
    public class AreaAgencyApplyManager : ApplicationDomainServiceBase
    {
        public IRepository<User, long> UserRepository { get; set; }

        public IRepository<AreaAgency> AreaAgencyRepository { get; set; }

        public IRepository<AreaAgencyApply> AreaAgencyApplyRepository { get; set; }
        public IRepository<AreaAgencyApplyAddress> AreaAgencyApplyAddressRepository { get; set; }

        public AreaAgencyManager AreaAgencyManager { get; set; }

        public AreaAgencyApply GetApplyingAreaAgencyApplyOfUser(long userId)
        {
            return AreaAgencyApplyRepository.GetAll().Where(model => model.UserId == userId && model.Status == AgencyApplyStatus.Applying).FirstOrDefault();
        }

        public AreaAgencyApply CreateAreaAgencyApply(int areaAgentId, long userId, int orderId,int[] addressIds)
        {
            AreaAgencyApply areaAgencyApply = new AreaAgencyApply()
            {
                UserId = userId,
                OrderId = orderId,
                AreaAgentId = areaAgentId,
                Status = AgencyApplyStatus.Applying,
                AreaAgencyApplyAddresses=new List<AreaAgencyApplyAddress>()
            };

            foreach(int addressId in addressIds)
            {
                areaAgencyApply.AreaAgencyApplyAddresses.Add(new AreaAgencyApplyAddress()
                {
                    AddressId = addressId
                });
            }
            AreaAgencyApplyRepository.Insert(areaAgencyApply);
            CurrentUnitOfWork.SaveChanges();
            return areaAgencyApply;
        }

        [UnitOfWork]
        public void DeleteAreaAgencyApplyByOrderId(int orderId)
        {
            AreaAgencyApply areaAgencyApply = AreaAgencyApplyRepository.GetAll().Where(model => model.OrderId == orderId).FirstOrDefault();
            AreaAgencyApplyAddressRepository.Delete(model => model.AreaAgencyApplyId == areaAgencyApply.Id);
            AreaAgencyApplyRepository.Delete(areaAgencyApply);
        }

        [UnitOfWork]
        public void DeleteAreaAgencyApplyById(int id)
        {
            AreaAgencyApplyAddressRepository.Delete(model => model.AreaAgencyApplyId == id);
            AreaAgencyApplyRepository.Delete(model => model.Id == id);
        }

        [UnitOfWork]
        public AreaAgencyApply PassAreaAgencyApply(AreaAgencyApply areaAgencyApply)
        {
            using (CurrentUnitOfWork.SetTenantId(areaAgencyApply.TenantId))
            {
                AreaAgencyManager.CreateAreaAgency(areaAgencyApply.User,areaAgencyApply.AreaAgentId, areaAgencyApply.GetAddressIds());
                areaAgencyApply.Status = AgencyApplyStatus.Success;
                AreaAgencyApplyRepository.Update(areaAgencyApply);
                CurrentUnitOfWork.SaveChanges();
                return areaAgencyApply;
            }
        }
    }
}
