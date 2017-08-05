using System.ComponentModel.DataAnnotations;
using Infrastructure.Application.DTO;

namespace Application.Localization.Dto
{
    public class CreateOrUpdateLanguageInput
    {
        [Required]
        public ApplicationLanguageEditDto Language { get; set; }
    }
}