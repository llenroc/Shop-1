using Application.Orders.Entities;
using Infrastructure.Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Orders.Fronts.Dto
{
    public class OrderGetAllInput : PagedAndSortedResultRequestDto
    {
        public OrderStatus? OrderStatus { get; set; }
    }
}
