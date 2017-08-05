using Application.Products;
using Application.Products.Fronts;
using Application.Products.Fronts.Dto;
using Infrastructure.Domain.Repositories;
using Infrastructure.UI;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class ProductController : AuthorizationMobileControllerBase
    {
        public ProductForFrontAppService ProductForFrontAppService { get; set; }
        public IRepository<Product> ProductRespository { get; set; }

        // GET: Mobile/Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Detail(ProductGetInput input)
        {
            Product product = ProductRespository.Get(input.Id);

            if (product.Status == ProductStatus.Off)
            {
                throw new UserFriendlyException(L("TheProductHasOff"));
            }

            if (product.IsRedirectExternal)
            {
                Redirect(product.ExternalLink);
            }
            ViewBag.PageTitle = L("ProductDetail");
            return View("~/Areas/Mobile/Views/Product/Detail/Templates/"+product.TemplateId+".cshtml", input);
        }
    }
}