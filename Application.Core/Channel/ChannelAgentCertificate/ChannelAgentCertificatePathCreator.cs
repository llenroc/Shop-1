using Application.PictureTemplates;
using Infrastructure.IO;
using Utility.Web;

namespace Application.Channel.ChannelAgentCertificate
{
    public class ChannelAgentCertificatePathCreator : IPicturePathCreator<ChannelAgentCertificateCreateInput>
    {
        public AppFolderHelper AppFolderHelper { get; set; }

        public string GetRelativePath(ChannelAgentCertificateCreateInput data)
        {
            string userAreaAgentCertificateFolderPath = GetChannelAgentCertificateFolderPathOfUser(data);
            return userAreaAgentCertificateFolderPath + "/" + data.ChannelAgency.ChannelAgentId + ".jpg";
        }

        private string GetChannelAgentCertificateFolderPathOfUser(ChannelAgentCertificateCreateInput data)
        {
            string userResourceFolder = AppFolderHelper.GetUserResourcePath(data.User.Id);
            string userPictureFolderPath = userResourceFolder + "/ChannelAgentCertificate";
            DirectoryHelper.CreateIfNotExists(PathHelper.GetAbsolutePath(userPictureFolderPath));
            return userPictureFolderPath;
        }
    }
}
