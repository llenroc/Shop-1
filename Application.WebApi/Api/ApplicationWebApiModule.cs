using System.Reflection;
using System.Web.Http;
using Infrastructure.Application.Services;
using Infrastructure.Configuration.Startup;
using Infrastructure.Modules;
using Infrastructure.WebApi;
using Swashbuckle.Application;
using System.Linq;

namespace Application.Api
{
    [DependsOn(typeof(InfrastructureWebApiModule), typeof(ApplicationApplicationModule))]
    public class ApplicationWebApiModule : InfrastructureModule
    {
        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(Assembly.GetExecutingAssembly());

            Configuration.Modules.WebApi().DynamicApiControllerBuilder
                .ForAll<IApplicationService>(typeof(ApplicationApplicationModule).Assembly, "app")
                .Build();

            Configuration.Modules.WebApi().HttpConfiguration.Filters.Add(new HostAuthenticationFilter("Bearer"));

            ConfigureSwaggerUi();
        }

        private void ConfigureSwaggerUi()
        {
            Configuration.Modules.WebApi().HttpConfiguration
                .EnableSwagger(c =>
                {
                    c.UseFullTypeNameInSchemaIds();
                    c.SingleApiVersion("v1", "Application.WebApi");
                    c.ResolveConflictingActions(apiDescriptions => apiDescriptions.First());
                })
                .EnableSwaggerUi();
        }
    }
}
