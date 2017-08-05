using Application.WebSite.Controllers;
using Application.WebSite.Filters;

namespace Application.WebSite.Areas.Manager.Controllers
{
    public class ManagerControllerBase : AuthorizationHomeControllerBase
    {
        public string mainMenuName { get; set; }
        public string subMenuName { get; set; }

        public ManagerControllerBase()
        {

        }
    }
}