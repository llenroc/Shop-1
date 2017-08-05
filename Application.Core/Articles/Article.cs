using Infrastructure.Domain.Entities;
using Infrastructure.Domain.Entities.Auditing;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Articles
{
    public class Article:FullAuditedEntity,IMustHaveTenant
    {
        public int TenantId { get; set; }

        [Required]
        [MaxLength(200)]
        public string Title { get; set; }

        [MaxLength(200)]
        public string SubTitle { get; set; }

        [Required]
        [MaxLength(ApplicationConsts.MaxUrlLength)]
        public string Thumbnail { get; set; }

        [MaxLength(500)]
        public string Description { get; set; }

        [Required]
        public string Content { get; set; }

        [Required]
        [MaxLength(20)]
        public string Author { get; set; }

        public int Hint { get; set; }

        public int Like { get; set; }

        public int DisLike { get; set; }

        public int CommentCount { get; set; }

        [MaxLength(20)]
        public string KeyWord { get; set; }

        public bool IsRedirectExternal { get; set; }

        [MaxLength(ApplicationConsts.MaxUrlLength)]
        public string ExternalLink { get; set; }

        public virtual ICollection<ArticleHint> ArticleHints { get; set; }
    }
}
