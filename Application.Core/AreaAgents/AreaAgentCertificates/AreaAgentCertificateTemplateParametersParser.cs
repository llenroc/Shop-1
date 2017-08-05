using Application.PictureTemplates;
using System.Collections.Generic;

namespace Application.AreaAgents.AreaAgentCertificates
{
    public class AreaAgentCertificateTemplateParametersParser: ITemplateParametersParser<AreaAgentCertificateCreateInput>
    {
        public void Parse(List<TemplateParameter> templateParameters, AreaAgentCertificateCreateInput data)
        {
            foreach(TemplateParameter templateParameter in templateParameters)
            {
                switch (templateParameter.Name)
                {
                    case "agentName":
                        templateParameter.Value = data.AreaAgency.AreaAgent.Name;
                        break;
                    case "number":
                        templateParameter.Value = data.AreaAgency.Number;
                        break;
                    case "areas":
                        templateParameter.Value = data.AreaAgency.GetAddresses();
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
                    case "date":
                        templateParameter.Value = data.AreaAgency.CreationTime.ToString("yyyy-MM-dd");
                        break;
                }
            }
        }
    }
}
