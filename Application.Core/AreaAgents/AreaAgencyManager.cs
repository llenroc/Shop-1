using Application.Authorization.Users;
using Application.Regions;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Application.AreaAgents
{
    public class AreaAgencyManager : ApplicationDomainServiceBase
    {
        public AreaAgencyNumberCreator AgencyNumberCreator { get; set; }
        public IRepository<User, long> UserRepository { get; set; }
        public IRepository<Address> AddressRepository { get; set; }
        public IRepository<AreaAgent> AreaAgentRepository { get; set; }
        public IRepository<AreaAgency> AreaAgencyRepository { get; set; }
        public IRepository<AreaAgencyArea> AreaAgencyAreaRepository { get; set; }
        public AreaAgentManager AreaAgentManager { get; set; }

        public List<AreaAgency> GetAreaAgencysOfUser(long userId)
        {
            return AreaAgencyRepository.GetAll().Where(model => model.UserId == userId).ToList();
        }

        public AreaAgency GetAreaAgencyOfUser(int areaAgentId)
        {
            AreaAgency areaAgency = AreaAgencyRepository.GetAll().Where(model => model.AreaAgentId == areaAgentId && model.UserId == InfrastructureSession.UserId.Value).FirstOrDefault();

            if (areaAgency == null)
            {
                throw new Exception("YouAreNotThisAreaAgency");
            }
            return areaAgency;
        }

        public AreaAgency GetAreaAgencyOfUserFromLevel(long userId,int level)
        {
            return AreaAgencyRepository.GetAll().Where(model => model.UserId == userId && model.Level == level).FirstOrDefault();
        }

        [UnitOfWork]
        public void DeleteAreaAgency(int areaAgencyId)
        {
            AreaAgency areaAgency = AreaAgencyRepository.Get(areaAgencyId);

            if (areaAgency == null)
            {
                throw new Exception(L("ThereHasNoThisAreaAgency"));
            }
            long userId = areaAgency.UserId;

            foreach (AreaAgencyArea areaAgencyArea in areaAgency.AreaAgencyAreas)
            {
                AreaAgencyAreaRepository.Delete(areaAgencyArea);
            }
            AreaAgencyRepository.Delete(areaAgency);
            CurrentUnitOfWork.SaveChanges();

            List<AreaAgency> areaAgencys = GetAreaAgencysOfUser(userId);

            if (areaAgencys.Count() == 0)
            {
                User user = UserRepository.Get(userId);
                user.IsAreaAgency = false;
                UserRepository.Update(user);
            }
        }

        [UnitOfWork]
        public AreaAgency CreateAreaAgency(User user,int areaAgentId,int[] addressIds)
        {
            using (CurrentUnitOfWork.SetTenantId(user.TenantId))
            {
                AreaAgent areaAgent = AreaAgentRepository.Get(areaAgentId);
                List<Address> addresses = AddressRepository.GetAll().Where(model =>model.Level== areaAgent.Level&&addressIds.Contains(model.Id)).ToList();
                AreaAgency areaAgency = GetAreaAgencyOfUserFromLevel(user.Id, areaAgent.Level);

                if (areaAgency == null)
                {
                    areaAgency = new AreaAgency()
                    {
                        UserId = user.Id,
                        AreaAgentId = areaAgent.Id,
                        Level= areaAgent.Level,
                        Number= AgencyNumberCreator.GetNumber()
                    };
                    AreaAgencyRepository.Insert(areaAgency);
                    areaAgency.User.IsAreaAgency = true;
                    UserRepository.Update(areaAgency.User);
                }
                CurrentUnitOfWork.SaveChanges();
                AttachAddressesToAreaAgency(areaAgency, addresses);
                return areaAgency;
            }
        }

        public void AttachAddressesToAreaAgency(AreaAgency areaAgency, List<Address> addresses)
        {
            foreach(Address address in addresses)
            {
                AreaAgencyArea areaAgencyArea = new AreaAgencyArea()
                {
                    AddressId= address.Id,
                    AreaAgencyId =areaAgency.Id,
                    UserId= areaAgency.UserId,
                    DevelopLevel=address.DevelopLevel,
                    ProvinceName=address.GetProvinceName(),
                    Level=areaAgency.AreaAgent.Level,
                    AreaAgentId=areaAgency.AreaAgentId
                };
                AreaAgencyAreaRepository.Insert(areaAgencyArea);
            }
        }
    }
}
