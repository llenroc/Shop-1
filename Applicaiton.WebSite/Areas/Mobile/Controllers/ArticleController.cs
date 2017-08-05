using Application.Articles;
using Infrastructure.Application.DTO;
using Infrastructure.Domain.Repositories;
using Infrastructure.UI;
using System.Web.Mvc;

namespace Application.WebSite.Areas.Mobile.Controllers
{
    public class ArticleController : AuthorizationMobileControllerBase
    {
        public IRepository<Article> ArticleRepository { get; set; }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Content(IdInput input)
        {
            Article article = ArticleRepository.Get(input.Id);

            if (article==null)
            {
                throw new UserFriendlyException(L("TheArticleIsNotExsit"));
            }

            if (article.IsRedirectExternal)
            {
                Redirect(article.ExternalLink);
            }
            ViewBag.PageTitle = article.Title;
            return View(input);
        }
    }
}