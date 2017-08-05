using Infrastructure.Application.DTO;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class ProductCategoryController : AuthorizationMobileControllerBase
    {
        public ActionResult Index(IdInput input)
        {
            return View(input);
        }
    }
}