using Application.Authorization.Users;
using Application.Orders.Entities;
using Infrastructure.Domain.Repositories;
using Infrastructure.Localization;
using Infrastructure.Notifications;
using System.Threading.Tasks;

namespace Application.Orders.Notifications
{
    public class OrderNotifier : ApplicationDomainServiceBase, IOrderNotifier
    {
        private readonly INotificationPublisher _notificationPublisher;

        public IRepository<User, long> UserRepository { get; set; }

        public OrderNotifier(INotificationPublisher notificationPublisher)
        {
            _notificationPublisher = notificationPublisher;
        }

        public async Task OrderPayed(Order order)
        {
            var notificationData = new LocalizableMessageNotificationData(new LocalizableString(
                    "OrderPayedNotificationMessage",
                    ApplicationConsts.LocalizationSourceName
                    ));
            notificationData["orderTitle"] = order.Title;
            notificationData["payMoney"] = order.PayMoney;

            await _notificationPublisher.PublishAsync(
                OrderNotificationNames.OrderPayed,
                notificationData,
                severity: NotificationSeverity.Success,
                tenantIds: new[] { (int?)order.TenantId }
                );
        }
    }
}
