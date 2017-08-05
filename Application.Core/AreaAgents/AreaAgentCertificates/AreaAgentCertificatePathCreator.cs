using Application.PictureTemplates;
using Infrastructure.IO;
using Utility.Web;

namespace Application.AreaAgents.AreaAgentCertificates
{
    public class AreaAgentCertificatePathCreator: IPicturePathCreator<AreaAgentCertificateCreateInput>
    {
        public AppFolderHelper AppFolderHelper { get; set; }

        public string GetRelativePath(AreaAgentCertificateCreateInput data)
        {
            string userAreaAgentCertificateFolderPath = GetAreaAgentCertificateFolderPathOfUser(data);
            return userAreaAgentCertificateFolderPath + "/" + data.AreaAgency.AreaAgentId + ".jpg";
        }

        private string GetAreaAgentCertificateFolderPathOfUser(AreaAgentCertificateCreateInput data)
        {
            string userResourceFolder = AppFolderHelper.GetUserResourcePath(data.User.Id);
            string userPictureFolderPath = userResourceFolder + "/AreaAgentCertificate";
            DirectoryHelper.CreateIfNotExists(PathHelper.GetAbsolutePath(userPictureFolderPath));
            return userPictureFolderPath;
        }
    }
}
