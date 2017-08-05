namespace Application.Products.Fronts.Dto
{
    public class ProductGetsInput
    {
        public int? ProductCategoryId { get; set; }

        public int MaxCount { get; set; }

        public bool IsRecent { get; set; }

        public bool IsHot { get; set; }
    }
}
