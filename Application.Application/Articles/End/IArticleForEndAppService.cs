using Application.Articles.End.Dto;
using Infrastructure.Application.Services;

namespace Application.Articles.End
{
    public interface IArticleForEndAppService:ICrudAppService<ArticleDto>
    {
    }
}