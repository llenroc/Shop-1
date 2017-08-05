using Infrastructure.Application.DTO;
using System.Collections.Generic;

namespace Application.Editions.Dto
{
    public class GetEditionForEditOutput
    {
        public EditionEditDto Edition { get; set; }

        public List<NameValueDto> FeatureValues { get; set; }

        public List<FlatFeatureDto> Features { get; set; }
    }
}