using Infrastructure.AutoMapper;
using System;

namespace Application.Articles.Front.Dto
{
    [AutoMapFrom(typeof(ArticleLike))]
    public class ArticleLikeDto
    {
        public DateTime CreationTime { get; set; }
        public LikeType Like { get; set; }
    }
}
