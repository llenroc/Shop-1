namespace Application.Configuration
{
    /// <summary>
    /// Defines string constants for setting names in the Application.
    /// See <see cref="SpreadSettingProvider"/> for setting definitions.
    /// </summary>
    public static class SpreadSettings
    {
        public static class General
        {
            public const string UpgradeOrderMoney = "Spread.General.UpgradeOrderMoney";
            public const string MustBeSpreaderForSpread= "Spread.General.MustBeSpreaderForSpread";
            public const string MustBeAgencyToGetSpreadPoster = "Spread.General.MustBeAgencyToGetSpreadPoster";
            public const string EnableSalesOfSelf = "Spread.General.EnableSalesOfSelf";
        }
    }
}