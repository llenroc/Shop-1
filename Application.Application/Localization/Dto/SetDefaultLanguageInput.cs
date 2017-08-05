using System.ComponentModel.DataAnnotations;
using Infrastructure.Application.DTO;
using Infrastructure.Localization;

namespace Application.Localization.Dto
{
    public class SetDefaultLanguageInput
    {
        [Required]
        [StringLength(ApplicationLanguage.MaxNameLength)]
        public virtual string Name { get; set; }
    }
}