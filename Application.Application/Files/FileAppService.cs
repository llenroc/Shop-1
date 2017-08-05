using Application.Files.Dto;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using System.Linq;

namespace Application.Files
{
    public class FileAppService:CrudAppService<InfrastructureFileInfo,FileInfoDto,int, FileGetAllInput>,IFileAppService
    {
        public FileAppService(
            IRepository<InfrastructureFileInfo> repository)
            :base(repository)
        {

        }

        protected override IQueryable<InfrastructureFileInfo> CreateFilteredQuery(FileGetAllInput input)
        {
            return Repository.GetAll();
        }
    }
}
