using System.ComponentModel.DataAnnotations;
using Infrastructure.AutoMapper;
using Infrastructure.Localization;

namespace Application.Localization.Dto
{
    [AutoMapFrom(typeof(ApplicationLanguage))]
    public class ApplicationLanguageEditDto
    {
        public virtual int? Id { get; set; }

        [Required]
        [StringLength(ApplicationLanguage.MaxNameLength)]
        public virtual string Name { get; set; }

        [StringLength(ApplicationLanguage.MaxIconLength)]
        public virtual string Icon { get; set; }
    }
}