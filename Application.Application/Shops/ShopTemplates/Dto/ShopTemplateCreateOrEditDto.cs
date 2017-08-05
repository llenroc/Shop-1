using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Shops.ShopTemplates.Dto
{
    [AutoMap(typeof(ShopTemplate))]
    public class ShopTemplateCreateOrEditDto : NullableIdDto
    {
        public bool IsDefault { get; set; }

        public string Name { get; set; }

        public string Template { get; set; }
    }
}
