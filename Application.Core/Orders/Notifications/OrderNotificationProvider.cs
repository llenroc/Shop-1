using Infrastructure.Localization;
using Infrastructure.Notifications;

namespace Application.Orders.Notifications
{
    public class OrderNotificationProvider : NotificationProvider
    {
        public override void SetNotifications(INotificationDefinitionContext context)
        {
            context.Manager.Add(
                new NotificationDefinition(
                    OrderNotificationNames.OrderCreated,
                    displayName: L("OrderCreatedNotificationDefinition")
                    )
                );

            context.Manager.Add(
               new NotificationDefinition(
                   OrderNotificationNames.OrderPayed,
                   displayName: L("OrderPayedNotificationDefinition")
                   )
               );
        }

        private static ILocalizableString L(string name)
        {
            return new LocalizableString(name, ApplicationConsts.LocalizationSourceName);
        }
    }
}
