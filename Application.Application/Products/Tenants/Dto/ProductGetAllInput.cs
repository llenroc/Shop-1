using Infrastructure.Application.DTO;

namespace Application.Products.Tenants.Dto
{
    public class ProductGetAllInput:PagedAndSortedResultRequestDto
    {
        public string Type { get; set; }

        public string Name { get; set; }
    }
}
