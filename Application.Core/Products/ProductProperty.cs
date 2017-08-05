using Infrastructure.Domain.Entities;
using System.ComponentModel.DataAnnotations;

namespace Application.Products
{
    public class ProductProperty:Entity
    {
        public int ProductId { get; set; }

        [Required]
        public string Name { get;set;}

        [Required]
        public string Value { get; set; }
    }
}
