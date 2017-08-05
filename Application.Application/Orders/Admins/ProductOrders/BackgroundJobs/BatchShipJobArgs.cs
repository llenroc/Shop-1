namespace Application.Orders.Admins.ProductOrders.BackgroundJobs
{
    public class BatchShipJobArgs
    {
        public string FilePath { get; set; }

        public BatchShipJobArgs(string filePath)
        {
            FilePath = filePath;
        }
    }
}
