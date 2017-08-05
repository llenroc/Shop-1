using Application.Orders.Entities;
using Infrastructure.Application.DTO;
using System;

namespace Application.Orders.Admins.Dto
{
    public class OrderGetAllInput : PagedAndSortedResultRequestDto
    {
        public OrderStatus? OrderStatus { get; set; }

        public string Title { get; set; }

        public string Number { get; set; }

        public string TrackingNumber { get; set; }

        public DateTime? StartTime { get; set; }

        public DateTime? EndTime { get; set; }

        public string FullName { get; set; }

        public string PhoneNumber { get; set; }
    }
}
