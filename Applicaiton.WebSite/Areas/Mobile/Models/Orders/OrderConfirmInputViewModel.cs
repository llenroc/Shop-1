namespace Application.WebSite.Areas.Mobile.Models.Orders
{
    public class OrderConfirmInputViewModel
    {
        public int SpecificationId { get; set; }

        public int Count { get; set; }

        public int? CustomerInfoId { get; set; }
    }
}