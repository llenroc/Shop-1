using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Application.WebSite.Chat.SignalR
{
    public class SendChatMessageInput
    {
        public int? TenantId { get; set; }

        public long UserId { get; set; }

        public string UserName { get; set; }

        public string TenancyName { get; set; }

        public string Avatar { get; set; }

        public string Message { get; set; }
    }
}