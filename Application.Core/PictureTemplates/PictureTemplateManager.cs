using System;
using System.Drawing;
using System.IO;
using System.Threading.Tasks;
using Utility.Drawing;
using Utility.Web;

namespace Application.PictureTemplates
{
    public class PictureTemplateManager<TPictureTemplate,TData>
        : ApplicationDomainServiceBase
        where TPictureTemplate:PictureTemplate
    {
        protected ITemplateParametersParser<TData> _templateParametersParser;
        protected IPicturePathCreator<TData> _picturePathCreator;
        public AppFolderHelper AppFolderHelper { get; set; }

        public PictureTemplateManager(
            ITemplateParametersParser<TData> templateParametersParser,
            IPicturePathCreator<TData> picturePathCreator
            )
        {
            _templateParametersParser = templateParametersParser;
            _picturePathCreator = picturePathCreator;
        }

        private Image GetTarget(TPictureTemplate pictureTemplate)
        {
            string serverPathOfSource = PathHelper.GetAbsolutePath(pictureTemplate.Template);
            Image imgSrc = Image.FromFile(serverPathOfSource);
            return imgSrc;
        }

        public async Task<string> GetPictureAsync(TPictureTemplate pictureTemplate, TData data)
        {
            string path = _picturePathCreator.GetRelativePath(data);

            if (!File.Exists(PathHelper.GetAbsolutePath(path)))
            {
                await CreatePictureAsync(pictureTemplate, data);
            };
            return path;
        }

        public async Task<string> ReCreatePictureAsync(TPictureTemplate pictureTemplate, TData data)
        {
            string path = await CreatePictureAsync(pictureTemplate, data);
            return path;
        }

        public async Task<string> CreatePictureAsync(TPictureTemplate pictureTemplate, TData data)
        {
            string path = _picturePathCreator.GetRelativePath(data);
            Image imgSrc = GetTarget(pictureTemplate);
            _templateParametersParser.Parse(pictureTemplate.Parameters,data);

            using(Graphics graphics = Graphics.FromImage(imgSrc))
            {

                foreach (TemplateParameter parameter in pictureTemplate.Parameters)
                {
                    if (parameter.Type == TemplateParameterType.Picture)
                    {
                        Image image = Image.FromFile(PathHelper.GetAbsolutePath(parameter.Value));

                        graphics.DrawImage(image, new Rectangle(parameter.Coordinate.StartX,
                                                                                    parameter.Coordinate.StartY,
                                                                                    parameter.Coordinate.Width,
                                                                                    parameter.Coordinate.Height),
                                                           0, 0, image.Width, image.Height, GraphicsUnit.Pixel);
                    }
                    else
                    {
                        graphics.DrawImage(imgSrc, 0, 0, imgSrc.Width, imgSrc.Height);
                        string fontFamly = String.IsNullOrEmpty(parameter.FontStyle.FontFamly) ?
                            "SimHei" : parameter.FontStyle.FontFamly;

                        using (Font font = new Font(fontFamly, parameter.FontStyle.Size))
                        {
                            Color color = ColorHelper.colorHx16toRGB(parameter.FontStyle.Color);

                            using (Brush brush = new SolidBrush(color))
                            {
                                string text = parameter.Value;
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
