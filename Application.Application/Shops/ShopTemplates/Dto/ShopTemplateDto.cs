using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.Shops.ShopTemplates.Dto
{
    [AutoMap(typeof(ShopTemplate))]
    public class ShopTemplateDto:FullAuditedEntityDto
    {
        public bool IsDefault { get; set; }

        public string Name { get; set; }

        public string Template { get; set; }
    }
}
