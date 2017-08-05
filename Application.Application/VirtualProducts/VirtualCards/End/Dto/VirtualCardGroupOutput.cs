using System;

namespace Application.VirtualProducts.VirtualCards.End.Dto
{
    public class VirtualCardGroupOutput
    {
        public string Name { get; set; }

        public string Value { get; set; }

        public int? ExpireDays { get; set; }

        public string Remark { get; set; }

        public string Version { get; set; }

        public DateTime CreationTime { get; set; }

        public int Count { get; set; }
    }
}
