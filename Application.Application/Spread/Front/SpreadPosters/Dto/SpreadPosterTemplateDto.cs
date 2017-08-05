using Application.Spread.SpreadPosters.SpreadPosterTemplates;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;

namespace Application.SpreadPosters.Front.Dto
{
    [AutoMap(typeof(SpreadPosterTemplate))]
    public class SpreadPosterTemplateDto:EntityDto
    {
        public string Name { get; set; }

        public string Template { get; set; }

        public bool IsDefault { get; set; }
    }
}
