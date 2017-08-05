namespace Application.Configuration.Tenant.Dto
{
    public class ShopSettingsEditDto
    {
        public string Name { get; set; }
        public string Logo { get; set; }
        public string ShareTitle { get; set; }
        public string ShareDescription { get; set; }
        public string SharePicture { get; set; }
        public string DecreaseStockWhen { get; set; }
        public int OverTimeForDelete { get; set; }
        public bool ShouldHasParentForBuy { get; set; }
        public string DistributionWhen { get; set; }
        public int AutoReceiveLimit { get; set; }
        public bool RebateGuarantee { get; set; }
        public bool AutoWithdraw { get; set; }
        public bool AutoPayForWithdraw { get; set; }
    }
}
