﻿using Application.Authorization;
using Microsoft.Owin.Infrastructure;
using Microsoft.Owin.Logging;
using Microsoft.Owin.Security.Infrastructure;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Microsoft.Owin.Security.Weixin
{
    /// <summary>
    ///
    /// </summary>
    internal class WeixinAuthenticationHandler : AuthenticationHandler<WeixinAuthenticationOptions>
    {
        /// <summary>
        /// 公众号授权地址
        /// </summary>
        private const string MPAuthorizationEndpoint = "https://open.weixin.qq.com/connect/oauth2/authorize";
        private const string TokenEndpoint = "https://api.weixin.qq.com/sns/oauth2/access_token";
        private const string TokenRefreshEndpoint = "https://api.weixin.qq.com/sns/oauth2/refresh_token";
        private const string UserInfoEndpoint = "https://api.weixin.qq.com/sns/userinfo";

        private readonly ILogger _logger;
        private readonly HttpClient _httpClient;

        public WeixinAuthenticationHandler(HttpClient httpClient, ILogger logger)
        {
            _httpClient = httpClient;
            _logger = logger;
        }
        /// <summary>
        /// 生成状态码
        /// 因微信公众号授权对state字段的限制，这里改为使用Cookie存储数据
        /// 详细请参考：https://mp.weixin.qq.com/wiki?id=mp1465199793_BqlKA&t=0.2918104504400387
        /// </summary>
        /// <param name="extra"></param>
        /// <returns></returns>
        private string GenerateStateId(AuthenticationProperties extra)
        {
            string stateId = Guid.NewGuid().ToString().Replace("-", "");
            extra.Dictionary["stateId"] = stateId;
            string key = string.Format("_{0}State_{1}", base.Options.AuthenticationType, stateId);
            string stateValue = base.Options.StateDataFormat.Protect(extra);
            base.Response.Cookies.Append(key, stateValue, new CookieOptions
            {
                HttpOnly = true,
                Secure = base.Request.IsSecure
            });
            return stateId;
        }
        /// <summary>
        /// 验证状态码有效性
        /// </summary>
        /// <param name="stateId"></param>
        /// <param name="extra"></param>
        /// <returns></returns>
        private bool ValidateStateId(string stateId, out AuthenticationProperties extra)
        {
            string key = string.Format("_{0}State_{1}", base.Options.AuthenticationType, stateId);
            string protectedText = base.Request.Cookies[key];
            bool flag = string.IsNullOrWhiteSpace(protectedText);
            bool result;

            if (flag)
            {
                extra = null;
                result = false;
            }
            else
            {
                extra = base.Options.StateDataFormat.Unprotect(protectedText);
                bool flag2 = extra == null || !extra.Dictionary.ContainsKey("stateId") || extra.Dictionary["stateId"] != stateId;

                if (flag2)
                {
                    extra = null;
                    result = false;
                }
                else
                {
                    result = true;
                }
            }
            return result;
        }

        public override async Task<bool> InvokeAsync()
        {
            if (Options.CallbackPath.HasValue && Options.CallbackPath == Request.Path)
            {
                return await InvokeReturnPathAsync();
            }
            return false;
        }

        protected override async Task<AuthenticationTicket> AuthenticateCoreAsync()
        {
            AuthenticationProperties properties = null;

            try
            {
                string code = null;
                string state = null;

                IReadableStringCollection query = Request.Query;
                IList<string> values = query.GetValues("code");

                if (values != null && values.Count == 1)
                {
                    code = values[0];
                }
                values = query.GetValues("state");

                if (values != null && values.Count == 1)
                {
                    state = values[0];
                }

                if (!ValidateStateId(state, out properties))
                {
                    return null;
                }

                // OAuth2 10.12 CSRF
                if (!ValidateCorrelationId(properties, _logger))
                {
                    return new AuthenticationTicket(null, properties);
                }

                var tokenRequestParameters = new List<KeyValuePair<string, string>>()
                {
                    new KeyValuePair<string, string>("appid", Options.AppId),
                    new KeyValuePair<string, string>("secret", Options.AppSecret),
                    new KeyValuePair<string, string>("code", code),
                    new KeyValuePair<string, string>("grant_type", "authorization_code"),
                };
                var requestContent = new FormUrlEncodedContent(tokenRequestParameters);

                // 通过code获取access_token
                HttpResponseMessage response = await _httpClient.PostAsync(TokenEndpoint, requestContent, Request.CallCancelled);
                response.EnsureSuccessStatusCode();
                string oauthTokenResponse = await response.Content.ReadAsStringAsync();

                JObject oauth2Token = JObject.Parse(oauthTokenResponse);
                var accessToken = oauth2Token["access_token"].Value<string>();

                // Refresh token is only available when wl.offline_access is request.
                // Otherwise, it is null.
                var refreshToken = oauth2Token.Value<string>("refresh_token");
                var expire = oauth2Token.Value<string>("expires_in");

                if (string.IsNullOrWhiteSpace(accessToken))
                {
                    _logger.WriteWarning("Access token was not found");
                    return new AuthenticationTicket(null, properties);
                }

                var openId = oauth2Token.Value<string>("openid");
                var scope = oauth2Token.Value<string>("scope");
                var unionId = oauth2Token.Value<string>("unionid");

                // 获取用户信息
                var userInfoResponse = await _httpClient.GetAsync(string.Format(UserInfoEndpoint + "?access_token={0}&openid={1}", Uri.EscapeDataString(accessToken), Uri.EscapeDataString(openId)), Request.CallCancelled);

                userInfoResponse.EnsureSuccessStatusCode();
                string userInfoResponseString = await userInfoResponse.Content.ReadAsStringAsync();

                JObject userInformation = JObject.Parse(userInfoResponseString);
                var context = new WeixinAuthenticatedContext(Context, userInformation, accessToken, refreshToken, expire);

                context.Identity = new ClaimsIdentity(new[] {
                    new Claim(ClaimTypes.Name,WeixinSecurityConstants.DefaultAuthenticationType , "http://www.w3.org/2001/XMLSchema#string", Options.AuthenticationType),
                    new Claim(ClaimTypes.Surname, context.OpenId, "http://www.w3.org/2001/XMLSchema#string", Options.AuthenticationType),
                    new Claim(ClaimTypes.NameIdentifier, context.OpenId, "http://www.w3.org/2001/XMLSchema#string", Options.AuthenticationType),
                    new Claim(CommonClaimType.NickName, context.Nickame, "http://www.w3.org/2001/XMLSchema#string", Options.AuthenticationType),
                    new Claim(CommonClaimType.Avatar,context.HeadimgUrl,"http://www.w3.org/2001/XMLSchema#string", Options.AuthenticationType),
                    new Claim(WeixinSecurityConstants.WeixinClaimType ,  userInfoResponseString , "http://www.w3.org/2001/XMLSchema#string", Options.AuthenticationType),
                },
                Options.AuthenticationType, 
                ClaimsIdentity.DefaultNameClaimType, 
                ClaimsIdentity.DefaultRoleClaimType);

                await Options.Provider.Authenticated(context);
                context.Properties = properties;
                return new AuthenticationTicket(context.Identity, context.Properties);
            }
            catch (Exception ex)
            {
                _logger.WriteError("Authentication failed", ex);
                return new AuthenticationTicket(null, properties);
            }
        }

        /// <summary>
        ///  执行401跳转
        /// </summary>
        /// <returns></returns>
        protected override Task ApplyResponseChallengeAsync()
        {
            if (Response.StatusCode != 401)
            {
                return Task.FromResult<object>(null);
            }
            //如果在login中不 Challenge 此处就会为null
            AuthenticationResponseChallenge challenge = Helper.LookupChallenge(Options.AuthenticationType, Options.AuthenticationMode);

            if (challenge != null)
            {
                string baseUri = Request.Scheme + Uri.SchemeDelimiter + Request.Host + Request.PathBase;
                string currentUri = baseUri + Request.Path + Request.QueryString;
                string redirectUri = baseUri + Options.CallbackPath;

                AuthenticationProperties authenticationProperties = challenge.Properties;

                if (string.IsNullOrEmpty(authenticationProperties.RedirectUri))
                {
                    authenticationProperties.RedirectUri = currentUri;
                }

                // OAuth2 10.12 CSRF
                GenerateCorrelationId(authenticationProperties);

                string stateId = GenerateStateId(authenticationProperties);
                string scope = null;
                string endPoint = null;
                scope = Options.Scope;
                endPoint = MPAuthorizationEndpoint;
                bool hasHost = !string.IsNullOrWhiteSpace(base.Options.ApiHost);

                if (hasHost)
                {
                    string host = base.Options.ApiHost;
                    Uri uri;

                    if (Options.ApiHost.IndexOf(":") > 0 && Uri.TryCreate(host, UriKind.RelativeOrAbsolute, out uri))
                    {
                        Uri endPointUri = new Uri(endPoint);
                        endPoint = new Uri(uri, endPointUri.PathAndQuery).ToString();
                    }
                    else
                    {
                        endPoint = new UriBuilder(endPoint)
                        {
                            Host = host
                        }.ToString();
                    }
                }
                string authorizationEndpoint = string.Format(endPoint + "?appid={0}&redirect_uri={1}&response_type=code&scope={2}&state={3}#wechat_redirect",
                    Uri.EscapeDataString(Options.AppId),
                    Uri.EscapeDataString(redirectUri),
                    Uri.EscapeDataString(scope),
                    Uri.EscapeDataString(stateId));

                //Context.Response.Redirect(authorizationEndpoint);

                var redirectContext = new WeixinApplyRedirectContext(Context, Options, authenticationProperties, authorizationEndpoint);
                Options.Provider.ApplyRedirect(redirectContext);
            }
            return Task.FromResult<object>(null);
        }

        public async Task<bool> InvokeReturnPathAsync()
        {
            AuthenticationTicket model = await AuthenticateAsync();

            if (model == null)
            {
                _logger.WriteWarning("Invalid return state, unable to redirect.");
                Response.StatusCode = 500;
                return true;
            }
            var context = new WeixinReturnEndpointContext(Context, model);
            context.SignInAsAuthenticationType = Options.SignInAsAuthenticationType;
            context.RedirectUri = model.Properties.RedirectUri;
            model.Properties.RedirectUri = null;

            await Options.Provider.ReturnEndpoint(context);

            if (context.SignInAsAuthenticationType != null && context.Identity != null)
            {
                ClaimsIdentity signInIdentity = context.Identity;

                if (!string.Equals(signInIdentity.AuthenticationType, context.SignInAsAuthenticationType, StringComparison.Ordinal))
                {
                    signInIdentity = new ClaimsIdentity(signInIdentity.Claims, context.SignInAsAuthenticationType, signInIdentity.NameClaimType, signInIdentity.RoleClaimType);
                }
                Context.Authentication.SignIn(context.Properties, signInIdentity);
            }

            if (!context.IsRequestCompleted && context.RedirectUri != null)
            {
                if (context.Identity == null)
                {
                    // add a redirect hint that sign-in failed in some way
                    context.RedirectUri = WebUtilities.AddQueryString(context.RedirectUri, "error", "access_denied");
                }
                Response.Redirect(context.RedirectUri);
                context.RequestCompleted();
            }
            return context.IsRequestCompleted;
        }

        private string GenerateRedirectUri()
        {
            string requestPrefix = Request.Scheme + "://" + Request.Host;

            string redirectUri = requestPrefix + RequestPathBase + Options.CallbackPath; // + "?state=" + Uri.EscapeDataString(Options.StateDataFormat.Protect(state));
            return redirectUri;
        }
    }
}