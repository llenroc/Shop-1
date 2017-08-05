using System.ComponentModel.DataAnnotations;
using Infrastructure.Application.DTO;
using Infrastructure.Localization;

namespace Application.Localization.Dto
{
    public class UpdateLanguageTextInput
    {
        [Required]
        [StringLength(ApplicationLanguage.MaxNameLength)]
        public string LanguageName { get; set; }

        [Required]
        [StringLength(ApplicationLanguageText.MaxSourceNameLength)]
        public string SourceName { get; set; }

        [Required]
        [StringLength(ApplicationLanguageText.MaxKeyLength)]
        public string Key { get; set; }

        [Required(AllowEmptyStrings = true)]
        [StringLength(ApplicationLanguageText.MaxValueLength)]
        public string Value { get; set; }
    }
}