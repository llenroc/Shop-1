using System.ComponentModel.DataAnnotations;

namespace Application.Orders.Fronts.Products.Dto
{
    public class CommentInput
    {
        public int OrderItemId { get; set; }

        [Required]
        [MaxLength(255)]
        public string Content { get; set; }
    }
}
