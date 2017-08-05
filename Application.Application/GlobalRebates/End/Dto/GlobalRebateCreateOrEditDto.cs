using Application.GlobalRebates;
using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Application.DTO;

namespace Application.GlobalRebates.End.Dto
{
    [AutoMap(typeof(GlobalRebate))]
    public class GlobalRebateCreateOrEditDto:NullableIdDto
    {
        public decimal Money { get; set; }

        public float Ratio { get; set; }

        public long UserId { get; set; }
    }
}
