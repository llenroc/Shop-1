using Application.Articles.Front.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;

namespace Application.Articles.Front
{
    public interface IArticleForFrontAppService : ICrudAppService<ArticleDto>
    {
        ArticleGetOutput GetArticle(EntityDto<int> input);
        ArticleLikeDto AddLike(ArticleLikeInput input);
    }
}