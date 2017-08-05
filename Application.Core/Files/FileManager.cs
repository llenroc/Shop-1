using Infrastructure.Dependency;
using Infrastructure.Domain.Repositories;

namespace Application.Files
{
    public class FileManager:ISingletonDependency
    {
        public IRepository<InfrastructureFileInfo> _repository { get; set; }

        public InfrastructureFileInfo Create(InfrastructureFileInfo fileInfo)
        {
            _repository.Insert(fileInfo);
            return fileInfo;
        }
    }
}
