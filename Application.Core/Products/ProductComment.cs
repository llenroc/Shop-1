using Application.Authorization.Users;
using Infrastructure.Domain.Entities.Auditing;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Products
{
    public class ProductComment:FullAuditedEntity
    {
        public int ProductId { get; set; }

        public int OrderId { get; set; }

        public int OrderItemId { get; set; }

        [MaxLength(1024)]
        [Required]
        public string Content { get; set; }

        [ForeignKey("CreatorUserId")]
        public virtual User CreatorUser { get; set; }
    }
}
