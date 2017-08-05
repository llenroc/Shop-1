using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Emailing
{
    public interface IEmailTemplateProvider
    {
        string GetDefaultTemplate();
    }
}
