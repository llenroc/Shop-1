﻿using Castle.Core.Logging;
using Infrastructure.Dependency;
using Microsoft.AspNet.Identity;
using System.Threading.Tasks;

namespace Application.Identity
{
    public class IdentitySmsMessageService : IIdentityMessageService, ITransientDependency
    {
        public ILogger Logger { get; set; }

        public IdentitySmsMessageService()
        {
            Logger = NullLogger.Instance;
        }

        public Task SendAsync(IdentityMessage message)
        {
            //TODO: Implement this service to send SMS to users. This is used by UserManager (ASP.NET Identity) on two factor auth.

            Logger.Warn("Sending SMS is not implemented! Message content:");
            Logger.Warn("Destination : " + message.Destination);
            Logger.Warn("Subject     : " + message.Subject);
            Logger.Warn("Body        : " + message.Body);

            return Task.FromResult(0);
        }
    }
}
