using Infrastructure.Domain.Entities;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Application.Regions
{
    public enum DevelopLevel
    {
        Normal,
        Developed
    }

    public class Address : Entity
    {
        public string Code { get; set; }

        public string Name { get; set; }

        public int? ParentId { get; set; }

        public virtual Address Parent { get; set; }

        [ForeignKey("ParentId")]
        public virtual ICollection<Address> Children { get; set; }

        public int Level { get; set; }

        public DevelopLevel DevelopLevel { get; set; }

        public int Sort { get; set; }

        public string EnglishName { get; set; }

        public string ShortEnglishName { get; set; }

        public string GetProvinceName()
        {
            Address currentAddress = this;

            while(currentAddress.Level>1)
            {
                currentAddress = currentAddress.Parent;
            }
            return currentAddress.Name;
        }

        public string GetFullAddress()
        {
            string fullAddress = "";
            GetFullAddressRecursion(this,ref fullAddress);
            return fullAddress;
        }

        private void GetFullAddressRecursion(Address address,ref string fullAddress)
        {
            fullAddress = address.Name + fullAddress;

            if (address.Parent != null)
            {
                GetFullAddressRecursion(address.Parent, ref fullAddress);
            }
        }
    }
}
