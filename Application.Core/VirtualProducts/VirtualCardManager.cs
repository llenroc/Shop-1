using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Application.VirtualProducts
{
    public class VirtualCardManager:ApplicationDomainServiceBase
    {
        public IRepository<VirtualCard> VirtualCardRepository { get; set; }

        [UnitOfWork]
        public VirtualCard GetVirtualCard(string name, string value)
        {
            VirtualCard virtualCard = VirtualCardRepository.GetAll()
                .Where(model => model.Name == name && model.Value == value && model.Status == VirtualCardStatus.Effective)
                .FirstOrDefault();
            virtualCard.Status = VirtualCardStatus.Used;
            VirtualCardRepository.Update(virtualCard);
            return virtualCard;
        }

        [UnitOfWork]
        public List<VirtualCard> GetVirtualCards(string name,string value,int count)
        {
            List<VirtualCard> virtualCards = VirtualCardRepository.GetAll()
                .Where(model => model.Name == name && model.Value == value&&model.Status== VirtualCardStatus.Effective)
                .Take(count)
                .ToList();

            if (virtualCards.Count() < count)
            {
                throw new ApplicationException(L("UnderStock"));
            }
            foreach(VirtualCard virtualCard in virtualCards)
            {
                virtualCard.Status = VirtualCardStatus.Used;
                VirtualCardRepository.Update(virtualCard);
            }
            return virtualCards;
        }
    }
}
