using Microsoft.Owin;
using System;
using System.Threading.Tasks;

namespace Application.WebSite.Middleware
{
    public class HelloWorldMiddleware : OwinMiddleware
    {
        public HelloWorldMiddleware(OwinMiddleware next) : base(next)
        {

        }


        public override Task Invoke(IOwinContext context)
        {
            string response = "Hello World! It is" + DateTime.Now;
            context.Response.Write(response);
            return Next.Invoke(context);
        }
    }
}