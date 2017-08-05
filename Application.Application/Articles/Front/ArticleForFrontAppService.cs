using Application.Articles.Front.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using System.Linq;

namespace Application.Articles.Front
{
    public class ArticleForFrontAppService : CrudAppService<Article, ArticleDto>, IArticleForFrontAppService
    {
        public ArticleManager ArticleManager { get; set; }
        private IRepository<ArticleLike> ArticleLikeRepository;
        public ArticleForFrontAppService(IRepository<Article> respository,  IRepository<ArticleLike> articleLikeRepository) :base(respository)
        {
            ArticleLikeRepository = articleLikeRepository;
        }

        public ArticleGetOutput GetArticle(EntityDto<int> input)
        {
            CheckGetPermission();
            var artile = GetEntityById(input.Id);
            ArticleManager.AddHint(InfrastructureSession.UserId.Value, artile);

            ArticleGetOutput articleGetOutput = new ArticleGetOutput()
            {
                Article= artile.MapTo<ArticleDto>(),
            };
            var articleLike = ArticleLikeRepository.GetAll().Where(model => model.ArticleId == input.Id && model.UserId == InfrastructureSession.UserId.Value).FirstOrDefault();

            if (articleLike != null)
            {
                articleGetOutput.ArticleLike = articleLike.MapTo<ArticleLikeDto>();
            }
            return articleGetOutput;
        }

        public ArticleLikeDto AddLike(ArticleLikeInput input)
        {
            ArticleLike articleLike=ArticleManager.AddLike(InfrastructureSession.UserId.Value,input.Id, input.LikeType);
            return articleLike.MapTo<ArticleLikeDto>();
        }
    }
}
