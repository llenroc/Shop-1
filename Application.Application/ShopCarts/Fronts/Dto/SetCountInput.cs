using Infrastructure.Application.DTO;
using System.ComponentModel.DataAnnotations;

namespace Application.ShopCarts.Fronts.Dto
{
    public class SetCountInput:EntityDto
    {
        [Range(1,int.MaxValue)]
        public int Count { get; set; }
    }
}
