using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.Articles.End.Dto
{
    [AutoMap(typeof(Article))]
    public class ArticleDto:FullAuditedEntityDto
    {
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

        public int CommentCount { get; set; }

        [MaxLength(20)]
        public string KeyWord { get; set; }

        public bool IsRedirectExternal { get; set; }

        [MaxLength(ApplicationConsts.MaxUrlLength)]
        public string ExternalLink { get; set; }
    }
}
