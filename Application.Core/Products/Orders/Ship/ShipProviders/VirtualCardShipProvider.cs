using Application.Orders.Entities;
using Application.Products.Orders.Entities;
using Application.VirtualProducts;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using System.Collections.Generic;

namespace Application.Products.Orders.Ship.ShipProviders
{
    public class VirtualCardShipProvider : ApplicationDomainServiceBase, IShipProvider
    {
        protected ProductOrderManager OrderManager;
        public VirtualCardManager VirtualCardManager { get; set; }
        public IRepository<OrderItemVirtualCard> OrderItemVirtualCardRepository { get; set; }

        public VirtualCardShipProvider(ProductOrderManager orderManager)
        {
            OrderManager = orderManager;
        }

        [UnitOfWork]
        public void Ship(ShipRequest shipRequest)
        {
            foreach (OrderItem orderItem in shipRequest.Order.OrderItems)
            {
                ShipOrderItem(orderItem);
            }
            OrderManager.CheckShipProgressAndCompleteShip(shipRequest.Order, shipRequest.ExpressInfo);
        }

        private void ShipOrderItem(OrderItem orderItem)
        {
            if (orderItem.ShipStatus != ShipStatus.UnShip)
            {
                return;
            }

            if (orderItem.Specification.Product.Type == ProductType.Virtual&&orderItem.Specification.Product.VirtualProductType==VirtualProductType.VirtualCard)
            {
                List<VirtualCard> virtualCards = VirtualCardManager.GetVirtualCards(orderItem.Specification.Product.CardName, orderItem.Specification.CardValue, orderItem.Count);

                foreach (VirtualCard virtualCard in virtualCards)
                {
                    OrderItemVirtualCard orderItemVirtualCard = new OrderItemVirtualCard()
                    {
                        OrderItemId = orderItem.Id,
                        OrderId = orderItem.OrderId,
                        UserId = orderItem.CreatorUserId.Value,
                        VirtualCardId = virtualCard.Id
                    };
                    OrderItemVirtualCardRepository.Insert(orderItemVirtualCard);
                }
                orderItem.ShipStatus = ShipStatus.Shipping;
            }
        }
    }
}
