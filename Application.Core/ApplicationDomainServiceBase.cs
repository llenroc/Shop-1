using Infrastructure.Domain.Services;
using Infrastructure.Event.Bus;
using Infrastructure.Runtime.Session;
using System;

namespace Application
{
    public class ApplicationDomainServiceBase : DomainService
    {
        public IEventBus EventBus { get; set; }

        public IInfrastructureSession InfrastructureSession { get; set; }

        protected ApplicationDomainServiceBase()
        {
            LocalizationSourceName = ApplicationConsts.LocalizationSourceName;
        }

        protected virtual void TriggerEventWithEntity(Type genericEventType, object entity, bool triggerInCurrentUnitOfWork)
        {
            var entityType = entity.GetType();
            var eventType = genericEventType.MakeGenericType(entityType);

            if (triggerInCurrentUnitOfWork || CurrentUnitOfWork == null)
            {
                EventBus.Trigger(eventType, (IEventData)Activator.CreateInstance(eventType, new[] { entity }));
                return;
            }
            CurrentUnitOfWork.Completed += (sender, args) => EventBus.Trigger(eventType, (IEventData)Activator.CreateInstance(eventType, new[] { entity }));
        }
    }
}
