using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Domain.Entities.Auditing;

namespace Application.Products
{
    public enum SpecificationPropertyType
    {
        Text,
        Color
    }

    public class SpecificationProperty : AuditedEntity
    {
        [Required]
        [MaxLength(64)]
        public string Name { get; set; }

        [MaxLength(256)]
        public string Description { get; set; }

        public SpecificationPropertyType Type { get; set; }

        public virtual ICollection<Product> Products { get; set; }

        public override bool Equals(object obj)
        {
            if (obj == null)
            {
                return false;
            }

            if ((obj.GetType().Equals(this.GetType())) == false)
            {
                return false;
            }
            SpecificationProperty temp = null;
            temp = (SpecificationProperty)obj;

            return this.Id.Equals(temp.Id);
        }

        //重写GetHashCode方法（重写Equals方法必须重写GetHashCode方法，否则发生警告

        public override int GetHashCode()
        {
            return this.Name.GetHashCode();
        }
    }
}
