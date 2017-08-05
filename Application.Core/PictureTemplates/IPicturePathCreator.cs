using Infrastructure.Dependency;

namespace Application.PictureTemplates
{
    public interface IPicturePathCreator<TData>:ISingletonDependency
    {
        string GetRelativePath(TData data);
    }
}
