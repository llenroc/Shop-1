using Infrastructure.Application.DTO;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Editions.Dto
{
    public class CreateOrUpdateEditionDto
    {
        [Required]
        public EditionEditDto Edition { get; set; }

        [Required]
        public List<NameValueDto> FeatureValues { get; set; }
    }
}