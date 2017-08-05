using Infrastructure.Application.Editions;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.Editions.Dto
{
    [AutoMap(typeof(Edition))]
    public class EditionEditDto
    {
        public int? Id { get; set; }

        [Required]
        public string DisplayName { get; set; }
    }
}