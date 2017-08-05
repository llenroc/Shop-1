using Application.Members.MemberCardPackageApplys.Orders.Entities;
using Application.Orders.Events;
using Infrastructure.Dependency;
using Infrastructure.Event.Bus.Handlers;

namespace Application.Members.MemberCardPackageApplys.Orders.EventHandlers
{
    public class MemberCardPackageOrderPayOrderEventHanlder : IEventHandler<OrderPayedEventData>, ITransientDependency
    {
        public MemberCardPackageOrderManager MemberCardPackageOrderManager { get; set; }

        public IMemberCardManager MemberCardManager { get; set; }

        public void HandleEvent(OrderPayedEventData eventData)
        {
            if (eventData.Order.GetType() == typeof(MemberCardPackageOrder))
            {
                MemberCardPackage memberCardPackage = MemberCardPackageOrderManager.GetMemberCardPackage(eventData.Order.Id);
                MemberCardManager.CreateMemberCard(memberCardPackage, eventData.Order.UserId);
                MemberCardPackageOrderManager.ProcessMemberCardPackage(eventData.Order.Id);
            }
        }
    }
}
