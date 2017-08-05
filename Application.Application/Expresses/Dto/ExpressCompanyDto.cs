using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.Expresses.Dto
{
    [AutoMap(typeof(ExpressCompany))]
    public class ExpressCompanyDto:EntityDto
    {
        [Required]
        public string Name { get; set; }

        public string Icon { get; set; }

        [Required]
        public string Code { get; set; }
    }
}
