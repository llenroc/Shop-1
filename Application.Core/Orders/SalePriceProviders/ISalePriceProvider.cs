namespace Application.Orders.SalePriceProviders
{
    public interface ISalePriceProvider<TBoughtContext>
    {
        TBoughtContext Caculate(TBoughtContext boughtContext);
    }
}
