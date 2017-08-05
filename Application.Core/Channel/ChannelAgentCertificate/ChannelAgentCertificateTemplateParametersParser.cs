using Application.PictureTemplates;
using System.Collections.Generic;

namespace Application.Channel.ChannelAgentCertificate
{
    public class ChannelAgentCertificateTemplateParametersParser : ITemplateParametersParser<ChannelAgentCertificateCreateInput>
    {
        public void Parse(List<TemplateParameter> templateParameters, ChannelAgentCertificateCreateInput data)
        {
            foreach (TemplateParameter templateParameter in templateParameters)
            {
                switch (templateParameter.Name)
                {
                    case "agentName":
                        templateParameter.Value = data.ChannelAgency.ChannelAgent.Name;
                        break;
                    case "number":
                        templateParameter.Value = data.ChannelAgency.Number;
                        break;
                    case "fullName":
                        templateParameter.Value = data.User.UserDetail.FullName;
                        break;
                    case "phoneNumber":
                        templateParameter.Value = data.User.UserDetail.PhoneNumber;
                        break;
                    case "wechatName":
                        templateParameter.Value = data.User.UserDetail.WechatName;
                        break;
                    case "identityNumber":
                        templateParameter.Value = data.User.UserDetail.IdentityNumber;
                        break;
                    case "avatar":
                        templateParameter.Value = data.User.Avatar;
                        break;
                    case "logo":
                        templateParameter.Value = data.ChannelAgency.ChannelAgent.Logo;
                        break;
                    case "date":
                        templateParameter.Value = data.ChannelAgency.CreationTime.ToString("yyyy-MM-dd");
                        break;
                }
            }
        }
    }
}
