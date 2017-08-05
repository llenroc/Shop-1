using Application.Authorization.Users;
using Infrastructure.Domain.Entities;
using Newtonsoft.Json.Linq;
using Senparc.Weixin.MP.AdvancedAPIs.User;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Application.Wechats
{
    public class WechatUserInfo: Entity,IMustHaveTenant
    {
        public WechatUserInfo(string userInformationString)
        {
            JObject user = JObject.Parse(userInformationString);

            if (user == null)
            {
                throw new ArgumentNullException("user");
            }
            this.OpenId = GetSafeValue("openid", user);
            this.Nickame = GetSafeValue("nickname", user);
            this.Province = GetSafeValue("province", user);
            this.City = GetSafeValue("city", user);
            this.Country = GetSafeValue("country", user);
            this.HeadimgUrl = GetSafeValue("headimgurl", user);
            this.Privilege = GetSafeValue("privilege", user);
            this.UnionId = GetSafeValue("unionid", user);

            if (user["sex"] != null)
            {
                this.Sex = int.Parse(user["sex"].ToString());
            }
        }

        private static string GetSafeValue(string name, IDictionary<string, JToken> dictionary)
        {
            if (!dictionary.ContainsKey(name))
            {
                return null;
            }
            return dictionary[name].ToString();
        }

        public WechatUserInfo(UserInfoJson userInfoJson)
        {
            OpenId = userInfoJson.openid;
            UnionId = userInfoJson.unionid;
            Nickame = userInfoJson.nickname;
            Sex = userInfoJson.sex;
            Province = userInfoJson.province;
            City = userInfoJson.city;
            Country = userInfoJson.country;
            HeadimgUrl = userInfoJson.headimgurl;
            Subscribe = Convert.ToBoolean(userInfoJson.subscribe); 
            SubscribeTime = userInfoJson.subscribe_time;
        }

        public WechatUserInfo()
        {

        }

        public int TenantId { get; set; }

        [MaxLength(32)]
        public string OpenId { get; set; }

        public string UnionId { get; set; }

        public string Nickame { get; set; }

        public int Sex { get; set; }

        public string Province { get; set; }

        public string City { get; set; }

        public string Country { get; set; }

        public string HeadimgUrl { get; set; }

        public string Privilege { get; set; }

        public bool Subscribe { get; set; }

        public long SubscribeTime { get; set; }

        public virtual User User { get; set; }
    }
}
