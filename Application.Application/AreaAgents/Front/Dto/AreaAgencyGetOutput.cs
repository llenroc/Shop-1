namespace Application.AreaAgents.Front.Dto
{
    public class AreaAgencyGetOutput
    {
        public AreaAgencyDto AreaAgency { get; set; }

        public int NormalAddressCount { get; set; }

        public int DevelopedAddressCount { get; set; }

        public decimal TotalRebate { get; set; }

        public decimal CustomerCount { get; set; }
    }
}
