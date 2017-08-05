using Application.CustomerInfos;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Products.Tenants.Dto
{
    [AutoMapTo(typeof(CustomCustomerInfo))]
    public class CustomCustomerInfoCreateOrEditInput : NullableIdDto
    {
        public int? ProductId { get; set; }

        public string Name { get; set; }

        public CustomCustomerInfoType Type { get; set; }

        public bool Required { get; set; }
    }
}
