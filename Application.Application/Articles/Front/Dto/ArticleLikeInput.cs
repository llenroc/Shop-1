using Infrastructure.Application.DTO;

namespace Application.Articles.Front.Dto
{
    public class ArticleLikeInput : EntityDto
    {
        public LikeType LikeType{get;set;}
    } 
}
