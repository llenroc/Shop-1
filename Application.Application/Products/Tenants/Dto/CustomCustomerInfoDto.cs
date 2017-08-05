using Application.CustomerInfos;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Products.Tenants.Dto
{
    [AutoMap(typeof(CustomCustomerInfo))]
    public class CustomCustomerInfoDto : EntityDto
    {
        public int ProductId { get; set; }

        public string Name { get; set; }

        public CustomCustomerInfoType Type { get; set; }

        public bool Required { get; set; }
    }
}
