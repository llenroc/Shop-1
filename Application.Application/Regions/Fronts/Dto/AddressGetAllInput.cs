namespace Application.Regions.Fronts.Dto
{
    public class AddressGetAllInput
    {
        public int? ParentId { get; set; } = 1;

        public bool IsLast { get; set; }
    }
}
