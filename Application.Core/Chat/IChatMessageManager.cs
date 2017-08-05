using Infrastructure;
using Infrastructure.Domain.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Chat
{
    public interface IChatMessageManager : IDomainService
    {
        void SendMessage(UserIdentifier sender, UserIdentifier receiver, string message, string senderTenancyName, string senderUserName,string senderAvatar);

        long Save(ChatMessage message);

        int GetUnreadMessageCount(UserIdentifier userIdentifier, UserIdentifier sender);
    }
}
