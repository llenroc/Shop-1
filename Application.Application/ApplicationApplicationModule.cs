using System.Reflection;
using Infrastructure.AutoMapper;
using Infrastructure.Modules;
using Application.Core;
using Application.IO;

namespace Application
{
    [DependsOn(typeof(ApplicationCoreModule))]
    public class ApplicationApplicationModule : InfrastructureModule
    {
        public override void PreInitialize()
        {
            //Adding custom AutoMapper mappings
            Configuration.Modules.AutoMapper().Configurators.Add(mapper =>
            {
                CustomDtoMapper.CreateMappings(mapper);
            });
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(Assembly.GetExecutingAssembly());
        }
    }
}
