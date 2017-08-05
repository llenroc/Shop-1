using Application.Authorization.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Runtime.Session
{
    public interface IApplicationSession
    {
        string EmailAddress { get; }

        string Name { get; }

        User User { get; }
    }
}
