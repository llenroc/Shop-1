using Application.PictureTemplates;

namespace Application.Channel.ChannelAgentCertificate
{
    public class ChannelAgentCertificateManager : PictureTemplateManager<PictureTemplate, ChannelAgentCertificateCreateInput>
    {
        public ChannelAgentCertificateManager(
        ChannelAgentCertificateTemplateParametersParser templateParametersParser,
        ChannelAgentCertificatePathCreator picturePathCreator
        ):base(templateParametersParser, picturePathCreator)
        {
        }
    }
}
