using Application.Files.Dto;
using Infrastructure.Application.Services;

namespace Application.Files
{
    public interface IFileAppService: ICrudAppService<FileInfoDto, int, FileGetAllInput>
    {
    }
}
