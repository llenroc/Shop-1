using Application.Entities;
using Infrastructure.Domain.Entities;
using System;

namespace Application.Articles
{
    public enum LikeType
    {
        None,
        Like,
        DisLike,
    }

    public class ArticleLike : Entity, IUserIdentifierEntity
    {
        public int TenantId { get; set; }
        public long UserId { get; set; }
        public DateTime CreationTime { get; set; }
        public int ArticleId { get; set; }
        public LikeType Like { get; set; }
    }
}
