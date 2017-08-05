namespace Application.Configuration
{
    /// <summary>
    /// Defines string constants for setting names in the Application.
    /// See <see cref="AppSettingProvider"/> for setting definitions.
    /// </summary>
    public static class WechatSettings
    {
        public static class General
        {
            public const string Token = "Wechat.General.Token";
            public const string AppId = "Wechat.General.AppId";
            public const string Secret = "Wechat.General.Secret";
            public const string EncodingAESKey = "Wechat.General.EncodingAESKey";
            public const string SubscribeLink = "Wechat.General.SubscribeLink";
        }

        public static class Pay
        {
            public const string MchId = "Wechat.Pay.MchId";
            public const string Key = "Wechat.Pay.Key";
            public const string SslcertPath = "Wechat.Pay.SslcertPath";
        }

        public static class TemplateMessage
        {
            public const string NewCustomer = "Wechat.TemplateMessage.NewCustomer";
            public const string OrderCreated = "Wechat.TemplateMessage.OrderCreated";
            public const string OrderPayed = "Wechat.TemplateMessage.OrderPayed";
            public const string OrderShiped = "Wechat.TemplateMessage.OrderShiped";
            public const string OrderRebate = "Wechat.TemplateMessage.OrderRebate";
            public const string WalletWithdraw = "Wechat.TemplateMessage.WalletWithdraw";
            public const string Upgrade = "Wechat.TemplateMessage.Upgrade";
        }
    }
}