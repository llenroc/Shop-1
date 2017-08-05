namespace Application.Orders.BoughtContexts
{
    public interface IBoughtContext<TOrder>
    {
        TOrder Order { get; set; }

        decimal Money { get; set; }

        int Score { get; set; }

        int ProductCount { get; }
    }
}
