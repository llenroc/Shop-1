using Infrastructure.Application.Editions;
using Infrastructure.Application.Features;
using Infrastructure.Domain.Repositories;

namespace Application.Editions
{
    public class EditionManager : CommonFrameEditionManager
    {
        public const string DefaultEditionName = "Standard";

        public EditionManager(
            IRepository<Edition> editionRepository, 
            ICommonFrameFeatureValueStore featureValueStore)
            : base(
                editionRepository,
                featureValueStore
            )
        {
        }
    }
}
