using Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application
{
    public abstract class ApplicationServiceBase : ServiceBase
    {
        protected ApplicationServiceBase()
        {
            LocalizationSourceName = ApplicationConsts.LocalizationSourceName;
        }
    }
}
