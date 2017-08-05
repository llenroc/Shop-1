using Application.PictureTemplates;
using System;

namespace Application.AreaAgents.AreaAgentCertificates
{
    public class AreaAgentCertificateManager: PictureTemplateManager<PictureTemplate, AreaAgentCertificateCreateInput>
    {
        public AreaAgentCertificateManager(
         AreaAgentCertificateTemplateParametersParser templateParametersParser,
         AreaAgentCertificatePathCreator picturePathCreator
         ):base(templateParametersParser, picturePathCreator)
        {
        }
    }
}
