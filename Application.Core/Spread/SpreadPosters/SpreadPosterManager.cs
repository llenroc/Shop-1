using Application.Authorization.Users;
using Application.PictureTemplates;
using Application.Spread.SpreadPosters.SpreadPosterTemplates;
using Application.Wechats.Qrcodes;
using Infrastructure;
using Infrastructure.Domain.Repositories;
using Infrastructure.IO;
using Infrastructure.UI;
using System;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Utility.Drawing;
using Utility.Web;

namespace Application.Spread.SpreadPosters
{
    public class SpreadPosterManager:ApplicationDomainServiceBase
    {
        public IRepository<SpreadPosterTemplate> SpreadPosterTemplateRepository { get; set; }
        public IRepository<User,long> UserRepository { get; set; }
        public SpreadManager SpreadManager { get; set; }

        public QrcodeManager QrcodeManager { get; set; }

        public AppFolderHelper AppFolderHelper { get; set; }

        public SpreadPosterTemplate GetDefaultSpreadPosterTemplate(UserIdentifier userIdentifier)
        {
            return SpreadPosterTemplateRepository.GetAll().Where(model => model.IsDefault == true).FirstOrDefault();
        }

        public async Task<string> GetDefaultSpreadPosterAsync(UserIdentifier userIdentifier)
        {
            SpreadPosterTemplate spreadPosterTemplate = GetDefaultSpreadPosterTemplate(userIdentifier);

            if (spreadPosterTemplate == null)
            {
                throw new Exception(L("ThereHasNoDefaultSpreadPostTemplate"));
            }
            string path = await GetSpreadPosterAsync(spreadPosterTemplate.Id, userIdentifier);
            return path;
        }

        private string GetSpreadPosterFolderPathOfUser(UserIdentifier userIdentifier)
        {
            string userResourceFolder = AppFolderHelper.GetUserResourcePath(userIdentifier.UserId);
            string userSpreadPosterFolderPath = userResourceFolder + "/SpreadPoster";
            DirectoryHelper.CreateIfNotExists(PathHelper.GetAbsolutePath(userSpreadPosterFolderPath));
            return userSpreadPosterFolderPath;
        }

        private string GetSpreadPosterPathOfUser(int spreadPosterTemplateId, UserIdentifier userIdentifier)
        {
            string userSpreadPosterFolderPath = GetSpreadPosterFolderPathOfUser(userIdentifier);
            return userSpreadPosterFolderPath + "/" + spreadPosterTemplateId + ".jpg";
        }

        public async Task<string> GetSpreadPosterAsync(int spreadPosterTemplateId, UserIdentifier userIdentifier)
        {
            await SpreadManager.CanGetSpreadPoster(userIdentifier);
            string path = GetSpreadPosterPathOfUser(spreadPosterTemplateId, userIdentifier);

            if (!File.Exists(PathHelper.GetAbsolutePath(path)))
            {
                await CreateSpreadPosterAsync(spreadPosterTemplateId, userIdentifier);
            };
            return path;
        }

        public async Task<string> ReCreateSpreadPosterAsync(int spreadPosterTemplateId, UserIdentifier userIdentifier)
        {
            string path=await CreateSpreadPosterAsync(spreadPosterTemplateId, userIdentifier);
            return path;
        }

        public async Task<string> ReCreateDefaultSpreadPosterAsync(UserIdentifier userIdentifier)
        {
            SpreadPosterTemplate spreadPosterTemplate = GetDefaultSpreadPosterTemplate(userIdentifier);

            if (spreadPosterTemplate == null)
            {
                throw new Exception(L("ThereHasNoDefaultSpreadPostTemplate"));
            }
            string path = await CreateSpreadPosterAsync(spreadPosterTemplate, userIdentifier);
            return path;
        }

        public async Task<string> CreateSpreadPosterAsync(int spreadPosterTemplateId, UserIdentifier userIdentifier)
        {
            SpreadPosterTemplate spreadPosterTemplate = SpreadPosterTemplateRepository.Get(spreadPosterTemplateId);

            if (spreadPosterTemplate == null)
            {
                throw new Exception(L("ThereNotExitSpreadPostTemplateWithThisId"));
            }
            string path = await CreateSpreadPosterAsync(spreadPosterTemplate, userIdentifier);
            return path;
        }

        public async Task<string> CreateSpreadPosterAsync(SpreadPosterTemplate spreadPosterTemplate, UserIdentifier userIdentifier)
        {
            string path = GetSpreadPosterPathOfUser(spreadPosterTemplate.Id, userIdentifier);

            using (CurrentUnitOfWork.SetTenantId(userIdentifier.TenantId))
            {
                User user = UserRepository.Get(userIdentifier.UserId);
                string serverPathOfSource = PathHelper.GetAbsolutePath(spreadPosterTemplate.Template);
                Image imgSrc = Image.FromFile(serverPathOfSource);

                foreach (TemplateParameter parameter in spreadPosterTemplate.Parameters)
                {
                    if (parameter.Type == TemplateParameterType.Picture)
                    {
                        Image image;

                        if (parameter.Name.ToLower() == "qrcode")
                        {
                            Qrcode qrcode = await QrcodeManager.GetQrcodeAsync(userIdentifier,false);
                            image = Image.FromFile(PathHelper.GetAbsolutePath(qrcode.Path));
                        }
                        else if (parameter.Name.ToLower() == "avatar")
                        {
                            if (user.Avatar.IndexOf("http://") >= 0)
                            {
                                System.Net.WebRequest webRequest = System.Net.WebRequest.Create(user.Avatar);
                                System.Net.WebResponse webResponse = webRequest.GetResponse();

                                using (Stream stream = webResponse.GetResponseStream())
                                {
                                    image = Image.FromStream(stream);
                                }
                            }
                            else
                            {
                                image = Image.FromFile(PathHelper.GetAbsolutePath(user.Avatar));
                            }
                        }
                        else
                        {
                            image = Image.FromFile(PathHelper.GetAbsolutePath(parameter.Value));
                        }
                        using (Graphics graphics = Graphics.FromImage(imgSrc))
                        {
                            graphics.DrawImage(image, new Rectangle(parameter.Coordinate.StartX,
                                                             parameter.Coordinate.StartY,
                                                             parameter.Coordinate.Width,
                                                             parameter.Coordinate.Height),
                                    0, 0, image.Width, image.Height, GraphicsUnit.Pixel);
                        }
                    }
                    else
                    {
                        using (Graphics graphics = Graphics.FromImage(imgSrc))
                        {
                            graphics.DrawImage(imgSrc, 0, 0, imgSrc.Width, imgSrc.Height);
                            string fontFamly = String.IsNullOrEmpty(parameter.FontStyle.FontFamly) ? "SimHei" : parameter.FontStyle.FontFamly;

                            using (Font font = new Font(fontFamly, parameter.FontStyle.Size))
                            {
                                Color color = ColorHelper.colorHx16toRGB(parameter.FontStyle.Color);

                                using (Brush brush = new SolidBrush(color))
                                {
                                    string text = parameter.Value;

                                    if (parameter.Name == "name")
                                    {
                                        text = user.NickName;
                                    }
                                    graphics.DrawString(text, font, brush, parameter.Coordinate.StartX, parameter.Coordinate.StartY);
                                }
                            }
                        }
                    }
                }
                string serverPath = PathHelper.GetAbsolutePath(path);
                imgSrc.Save(serverPath, System.Drawing.Imaging.ImageFormat.Jpeg);
                return path;
            }
        }
    }
}
