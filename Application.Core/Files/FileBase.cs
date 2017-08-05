using Infrastructure.Domain.Entities;

namespace Application.Files
{
    public class FileBase : Entity
    {
        public string Path { get; set; }
    }
}
