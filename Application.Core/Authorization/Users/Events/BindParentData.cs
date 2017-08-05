using Application.Orders.Entities;
using Infrastructure.Event.Bus;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Authorization.Users.Events
{
    [Serializable]
    public class BindParentEventData : EventData 
    {
        public User SourceUser { get; private set; }
        public User ParentUser { get; private set; }

        public BindParentEventData(User sourceUser, User parentUser)
        {
            SourceUser = sourceUser;
            ParentUser = parentUser;
        }
    }
}
