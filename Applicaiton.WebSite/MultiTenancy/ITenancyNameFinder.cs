using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Application.WebSite.MultiTenancy
{
    public interface ITenancyNameFinder
    {
        string GetCurrentTenancyNameOrNull();
    }
}