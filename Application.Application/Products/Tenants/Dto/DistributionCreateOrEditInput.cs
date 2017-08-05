using Application.Distributions;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Products.Tenants.Dto
{
    [AutoMapTo(typeof(Distribution))]
    public class DistributionCreateOrEditInput:NullableIdDto
    {
        public int? ProductId { get; set; }

        public BuyWhen BuyWhen { get; set; }

        public int Level { get; set; }

        public decimal Money { get; set; }

        public float Ratio { get; set; }
    }
}
