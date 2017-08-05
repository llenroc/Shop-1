using Infrastructure.Domain.Entities;

namespace Application.CustomerInfos
{
    public enum CustomCustomerInfoType
    {
        Text,
        PhoneNumber,
        Picture,
        DateTime
    }

    public class CustomCustomerInfo:Entity
    {
        public int ProductId { get; set; }

        public string Name { get; set; }

        public CustomCustomerInfoType Type { get; set; }

        public bool Required { get; set; }
    }
}
