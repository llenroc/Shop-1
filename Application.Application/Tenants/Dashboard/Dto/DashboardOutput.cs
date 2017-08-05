namespace Application.Tenants.Dashboard.Dto
{
    public class DashboardOutput
    {
        public UserActivityOutput UserActivity { get; set; }

        public OrderActivityOutput OrderActivity { get; set; }

        public int OrderCountToShip { get; set; }

        public int OrderCountOfYestoday { get; set; }

        public decimal TradingVolumeOfYestoday { get; set; }

        public decimal RebateOfYestoday { get; set; }
    }
}
