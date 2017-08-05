using Application.Regions;
using Infrastructure.Domain.Entities;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Orders.Entities
{
    public class OrderCustomerInfo:Entity
    {
        public virtual Order Order { get; set; }

        [Key, ForeignKey("Order")]
        public new int Id { get; set; }

        public string PhoneNumber { get; set; }

        public string DetailAddress { get; set; }

        public string FullName { get; set; }

        public virtual Address Address { get; set; }

        public int AddressId { get; set; }

        public string GetFullAddress()
        {
            if (Address == null)
            {
                return DetailAddress;
            }
            else
            {
                return Address.GetFullAddress() + DetailAddress;
            }
        }
    }
}
