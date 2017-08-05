using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Utility.Net
{
    public static class Image
    {
        public static Bitmap GetAndSaveImage(string url,string path)
        {
            Bitmap image = null;
            HttpWebRequest request;
            HttpWebResponse response = null;

            try
            {
                Uri httpUrl = new Uri(url);
                request = (HttpWebRequest)(WebRequest.Create(httpUrl));
                request.Method = "GET";
                response = (HttpWebResponse)(request.GetResponse());
                image = new Bitmap(response.GetResponseStream());//获取图片流                
                image.Save(path);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                response.Close();
            }
            return image;
        }
    }
}
