using Infrastructure.Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Orders.Fronts.Dto
{
    public class OrderGetInput : EntityDto
    {
        public OrderGetInput()
        {

        }

        public OrderGetInput(int Id):base(Id)
        {

        }
    }
}
