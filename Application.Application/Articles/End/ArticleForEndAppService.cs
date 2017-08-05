using Application.Articles.End.Dto;
using Application.Features;
using Infrastructure.Application.Features;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;

namespace Application.Articles.End
{
    [RequiresFeature(AppFeatures.ArticleFeature)]
    public class ArticleForEndAppService : CrudAppService<Article, ArticleDto>, IArticleForEndAppService
    {
        public ArticleForEndAppService(IRepository<Article> respository) :base(respository)
        {

        }
    }
}
