using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Dependency;

namespace Application.Orders.NumberProviders
{
    public interface INumberProvider:ISingletonDependency
    {
        string BuildNumber();
    }
}
