namespace Application.Configuration.Tenant.Dto
{
    public class SpreadSettingsEditDto
    {
        public decimal UpgradeOrderMoney { get; set; }
        public bool MustBeSpreaderForSpread { get; set; }
        public bool MustBeAgencyToGetSpreadPoster { get; set; }
        public bool EnableSalesOfSelf { get; set; }
    }
}
