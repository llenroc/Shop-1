namespace Application.Shops
{
    public enum DecreaseStockWhen
    {
        Create,
        Pay
    }

    public class ShopSettings
    {
        public static class General
        {
            public const string Name = "Shop.General.Name";
            public const string Logo = "Shop.General.Logo";
            public const string DecreaseStockWhen = "Shop.General.DecreaseStockWhen";
        }

        public static class Share
        {
            public const string ShareTitle = "Shop.Share.ShareTitle";
            public const string ShareDescription = "Shop.Share.ShareDescription";
            public const string SharePicture = "Shop.Share.SharePicture";
        }

        public static class Order
        {
            public const string OverTimeForDelete = "Shop.Order.OverTimeForDelete";
            public const string ShouldHasParentForBuy = "Shop.Order.ShouldHasParentForBuy";
            public const string AutoReceiveLimit = "Shop.Order.AutoReceiveLimit";
        }

        public static class Distribution
        {
            public const string DistributionWhen = "Shop.Distribution.DistributionWhen";
            public const string RebateGuarantee = "Shop.Distribution.RebateGuarantee";
            public const string AutoWithdraw = "Shop.Distribution.AutoWithdraw";
            public const string AutoPayForWithdraw = "Shop.Distribution.AutoPayForWithdraw";
        }
    }
}
