using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Utility.Net
{
    public class WebRequestHelper
    {
        public CookieContainer cookie = new CookieContainer();

        public string HttpPost(string Url, string postDataStr)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Url);
            //request.AllowAutoRedirect = false; //禁止自动重定向
            request.Method = "POST";
            request.ContentType = "application/x-www-form-urlencoded";
            request.ContentLength = Encoding.UTF8.GetByteCount(postDataStr);
            request.CookieContainer = cookie;

            Stream myRequestStream = request.GetRequestStream();
            StreamWriter myStreamWriter = new StreamWriter(myRequestStream, Encoding.GetEncoding("gb2312"));
            myStreamWriter.Write(postDataStr);
            myStreamWriter.Close();

            HttpWebResponse response = null;

            try
            {
                this.SetCertificatePolicy();
                response = (HttpWebResponse)request.GetResponse();
            }
            catch (System.Exception ex)
            {
            }

            //获取重定向地址
            //string url1 = response.Headers["Location"];
            if (response != null)
            {
                response.Cookies = cookie.GetCookies(response.ResponseUri);
                Stream myResponseStream = response.GetResponseStream();
                StreamReader myStreamReader = new StreamReader(myResponseStream, Encoding.GetEncoding("utf-8"));
                string retString = myStreamReader.ReadToEnd();
                myStreamReader.Close();
                myResponseStream.Close();
                return retString;
            }
            else
            {
                return "error"; //post请求返回为空
            }
        }

        public string HttpGet(string Url, string querydata="")
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Url + (querydata == "" ? "" : "?") + querydata);
            request.Method = "GET";
            request.ContentType = "text/html;charset=UTF-8";
            request.CookieContainer = cookie;

            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            // response.Cookies = cookie.GetCookies(response.ResponseUri);
            Stream myResponseStream = response.GetResponseStream();
            StreamReader myStreamReader = new StreamReader(myResponseStream, Encoding.GetEncoding("utf-8"));
            string retString = myStreamReader.ReadToEnd();
            myStreamReader.Close();
            myResponseStream.Close();

            return retString;
        }

        //注册证书验证回调事件，在请求之前注册
        private void SetCertificatePolicy()
        {
            ServicePointManager.ServerCertificateValidationCallback+= RemoteCertificateValidate;
        }
        /// <summary>  
        /// 远程证书验证，固定返回true 
        /// </summary>  
        private static bool RemoteCertificateValidate(object sender, X509Certificate cert,X509Chain chain, SslPolicyErrors error)
        {
            return true;
        }
    }
}
