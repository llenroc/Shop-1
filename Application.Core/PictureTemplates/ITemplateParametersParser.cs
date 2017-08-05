using Infrastructure.Dependency;
using System.Collections.Generic;

namespace Application.PictureTemplates
{
    public interface ITemplateParametersParser<TData> : ISingletonDependency
    {
        void Parse(List<TemplateParameter> templateParameters, TData data);
    }
}
