using Infrastructure.Dependency;
using Infrastructure.IO.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Application.Emailing
{
    public class EmailTemplateProvider : IEmailTemplateProvider, ITransientDependency
    {
        public string GetDefaultTemplate()
        {
            using (var stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("Application.Emailing.EmailTemplates.default.html"))
            {
                var bytes = stream.GetAllBytes();
                return Encoding.UTF8.GetString(bytes, 3, bytes.Length - 3);
            }
        }
    }
}
