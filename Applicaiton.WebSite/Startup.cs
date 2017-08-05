using Microsoft.Owin;
using Owin;
using Infrastructure.Owin;

[assembly: OwinStartupAttribute(typeof(Application.WebSite.Startup))]
namespace Application.WebSite
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.UseCommonFrame();
            ConfigureAuth(app);
            app.MapSignalR();
        }
    }
}
