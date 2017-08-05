namespace Application.WebSite.Areas.Mobile.Models.ScoreExchange
{
    public class ScoreExchangeOrderConfirmInputViewModel
    {
        public int ProductId { get; set; }

        public int SpecificationId { get; set; }

        public int Count { get; set; }

        public int? CustomerInfoId { get; set; }
    }
}