using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Application.DTO;
using Infrastructure.Extensions;
using Infrastructure.Localization;
using Infrastructure.Runtime.Validation;
using System.ComponentModel.DataAnnotations;

namespace Application.Localization.Dto
{
    public class GetLanguageTextsInput :PagedAndSortedResultRequestDto, IShouldNormalize
    {
        [Required]
        [MaxLength(ApplicationLanguageText.MaxSourceNameLength)]
        public string SourceName { get; set; }

        [StringLength(ApplicationLanguage.MaxNameLength)]
        public string BaseLanguageName { get; set; }

        [Required]
        [StringLength(ApplicationLanguage.MaxNameLength, MinimumLength = 2)]
        public string TargetLanguageName { get; set; }

        public string TargetValueFilter { get; set; }

        public string FilterText { get; set; }

        public void Normalize()
        {
            if (TargetValueFilter.IsNullOrEmpty())
            {
                TargetValueFilter = "ALL";
            }
        }
    }
}
