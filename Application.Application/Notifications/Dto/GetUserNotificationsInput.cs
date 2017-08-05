using Infrastructure.Notifications;
using Infrastructure.Application.DTO;

namespace Infrastructure.Notifications.Dto
{
    public class GetUserNotificationsInput : PagedResultRequestDto
    {
        public UserNotificationState? State { get; set; }
    }
}