using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Auditing
{
    public interface INamespaceStripper
    {
        string StripNameSpace(string serviceName);
    }
}
