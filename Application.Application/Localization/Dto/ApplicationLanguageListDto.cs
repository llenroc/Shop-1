using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using Infrastructure.Localization;

namespace Application.Localization.Dto
{
    [AutoMapFrom(typeof(ApplicationLanguage))]
    public class ApplicationLanguageListDto : FullAuditedEntityDto
    {
        public virtual int? TenantId { get; set; }
        
        public virtual string Name { get; set; }

        public virtual string DisplayName { get; set; }

        public virtual string Icon { get; set; }
    }
}