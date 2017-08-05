using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Articles.Front.Dto
{
    [AutoMapFrom(typeof(Article))]
    public class ArticleDto:AuditedEntityDto
    {
        public string Title { get; set; }

        public string SubTitle { get; set; }

        public string Thumbnail { get; set; }

        public string Description { get; set; }

        public string Content { get; set; }

        public string Author { get; set; }

        public int Hint { get; set; }

        public int Like { get; set; }

        public int DisLike { get; set; }

        public int CommentCount { get; set; }

        public string KeyWord { get; set; }

        public bool IsRedirectExternal { get; set; }

        public string ExternalLink { get; set; }
    }
}
