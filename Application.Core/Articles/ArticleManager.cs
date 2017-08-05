using Infrastructure.Domain.Repositories;
using Infrastructure.UI;
using System;
using System.Linq;

namespace Application.Articles
{
    public class ArticleManager: ApplicationDomainServiceBase
    { 
        public IRepository<Article> ArticleRepository { get; set; }
        public IRepository<ArticleHint> ArticleHintRepository { get; set; }
        public IRepository<ArticleLike> ArticleLikeRepository { get; set; }

        public void AddHint(long userId,int articleId)
        {
            var historyHint=ArticleHintRepository.GetAll().Where(model => model.ArticleId == articleId && model.UserId == userId).FirstOrDefault();

            if (historyHint != null)
            {
                return;
            }
            var hint = new ArticleHint()
            {
                ArticleId = articleId,
                UserId = userId,
                CreationTime = DateTime.Now,
            };
            ArticleHintRepository.Insert(hint);
            var article = ArticleRepository.Get(articleId);
            article.Hint++;
            ArticleRepository.Update(article);
            CurrentUnitOfWork.SaveChanges();
        }

        public void AddHint(long userId, Article article)
        {
            var historyHint = ArticleHintRepository.GetAll().Where(model => model.ArticleId == article.Id && model.UserId == userId).FirstOrDefault();

            if (historyHint != null)
            {
                return;
            }
            var hint = new ArticleHint()
            {
                ArticleId = article.Id,
                UserId = userId,
                CreationTime = DateTime.Now,
            };
            ArticleHintRepository.Insert(hint);
            article.Hint++;
            ArticleRepository.Update(article);
            CurrentUnitOfWork.SaveChanges();
        }

        public ArticleLike AddLike(long userId, int articleId,LikeType likeType)
        {
            var historyLike = ArticleLikeRepository.GetAll().Where(model => model.ArticleId == articleId && model.UserId == userId).FirstOrDefault();

            if (historyLike != null)
            {
                throw new UserFriendlyException(L("YouHasHintIt"));
            }
            var like = new ArticleLike()
            {
                ArticleId = articleId,
                UserId = userId,
                CreationTime = DateTime.Now,
                Like=likeType
            };
            ArticleLikeRepository.Insert(like);
            var article = ArticleRepository.Get(articleId);

            if (likeType == LikeType.Like)
            {
                article.Like++;
            }
            else if (likeType == LikeType.DisLike)
            {
                article.DisLike++;
            }
            ArticleRepository.Update(article);
            CurrentUnitOfWork.SaveChanges();
            return like;
        }
    }
}
