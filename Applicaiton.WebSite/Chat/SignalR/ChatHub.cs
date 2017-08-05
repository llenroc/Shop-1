using Application.Chat;
using Castle.Core.Logging;
using Infrastructure;
using Infrastructure.Dependency;
using Infrastructure.Localization;
using Infrastructure.Runtime.Session;
using Infrastructure.UI;
using Microsoft.AspNet.SignalR;
using System;

namespace Application.WebSite.Chat.SignalR
{
    public class ChatHub : Hub, ITransientDependency
    {
        /// <summary>
        /// Reference to the logger.
        /// </summary>
        public ILogger Logger { get; set; }

        /// <summary>
        /// Reference to the session.
        /// </summary>
        public IInfrastructureSession InfrastructureSession { get; set; }

        private readonly IChatMessageManager _chatMessageManager;
        private readonly ILocalizationManager _localizationManager;

        /// <summary>
        /// Initializes a new instance of the <see cref="ChatHub"/> class.
        /// </summary>
        public ChatHub(
            IChatMessageManager chatMessageManager,
            ILocalizationManager localizationManager)
        {
            _chatMessageManager = chatMessageManager;
            _localizationManager = localizationManager;

            Logger = NullLogger.Instance;
            InfrastructureSession = NullInfrastructureSession.Instance;
        }

        public string SendMessage(SendChatMessageInput input)
        {
            var sender = InfrastructureSession.ToUserIdentifier();
            var receiver = new UserIdentifier(input.TenantId, input.UserId);

            try
            {
                _chatMessageManager.SendMessage(sender, receiver, input.Message, input.TenancyName, input.UserName, input.Avatar);
                return string.Empty;
            }
            catch (UserFriendlyException ex)
            {
                Logger.Warn("Could not send chat message to user: " + receiver);
                Logger.Warn(ex.ToString(), ex);
                return ex.Message;
            }
            catch (Exception ex)
            {
                Logger.Warn("Could not send chat message to user: " + receiver);
                Logger.Warn(ex.ToString(), ex);
                return _localizationManager.GetSource("Web").GetString("InternalServerError");
            }
        }
    }
}