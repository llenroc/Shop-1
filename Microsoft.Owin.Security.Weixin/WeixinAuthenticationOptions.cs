using System;
using System.Net.Http;

namespace Microsoft.Owin.Security.Weixin
{
    /// <summary>
    /// Configuration options for <see cref="WeixinAuthenticationMiddleware"/>
    /// </summary>
    public class WeixinAuthenticationOptions : AuthenticationOptions
    {
        public WeixinAuthenticationOptions() 
            : base(WeixinSecurityConstants.DefaultAuthenticationType)
        {
            Caption = WeixinSecurityConstants.DefaultAuthenticationType;
            CallbackPath = new PathString("/signin-weixin");
            AuthenticationMode = AuthenticationMode.Passive;
            BackchannelTimeout = TimeSpan.FromSeconds(60);
        }

        public ICertificateValidator BackchannelCertificateValidator { get; set; }

        public string Caption
        {
            get
            {
                return base.Description.Caption;
            }
            set
            {
                base.Description.Caption = value;
            }
        }

        public TimeSpan BackchannelTimeout { get; set; }

        public HttpMessageHandler BackchannelHttpHandler { get; set; }

        /// <summary>
        /// The request path within the application's base path where the user-agent will be returned.
        /// The middleware will process this request when it arrives.
        /// Default value is "/signin-facebook".
        public PathString CallbackPath { get; set; }

        public string SignInAsAuthenticationType { get; set; }

        public IWeixinAuthenticationProvider Provider { get; set; }

        public ISecureDataFormat<AuthenticationProperties> StateDataFormat { get; set; }

        /// <summary>
        /// 应用唯一标识，在微信开放平台提交应用审核通过后获得
        /// </summary>
        public string AppId { get; set; }

        /// <summary>
        /// 应用密钥 AppSecret ，在微信开放平台提交应用审核通过后获得
        /// </summary>
        public string AppSecret { get; set; }
        /// <summary>
        /// 微信服务器主机
        /// 详细请参考：https://mp.weixin.qq.com/wiki?id=mp1465199793_BqlKA&t=0.2918104504400387
        /// </summary>
        public string ApiHost { set; get; }

        /// <summary>
        /// 用来获取进入页面的用户的openid的
        /// </summary>
        public const string SCOPE_BASE = "snsapi_base";
        /// <summary>
        /// 用来获取用户的基本信息的
        /// </summary>
        public const string SCOPE_USER_INFO = "snsapi_userinfo";

        public string Scope { set; get; } = SCOPE_USER_INFO;
    }
}