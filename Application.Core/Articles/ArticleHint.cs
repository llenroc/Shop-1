using Application.Entities;
using Infrastructure.Domain.Entities;
using System;

namespace Application.Articles
{
    public class ArticleHint:Entity, IUserIdentifierEntity
    {
        public int TenantId { get; set; }
        public long UserId { get; set; }
        public DateTime CreationTime { get; set; }
        public int ArticleId { get; set; }
    }
}
