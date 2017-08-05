namespace Application.Orders
{
    public class ExpressInfo
    {
        public int ExpressCompanyId { get; set; }

        public string TrackingNumber { get; set; }

        public ExpressInfo()
        {

        }

        public ExpressInfo(int expressCompanyId, string trackingNumber)
        {
            ExpressCompanyId = expressCompanyId;
            TrackingNumber = trackingNumber;
        }
    }
}
