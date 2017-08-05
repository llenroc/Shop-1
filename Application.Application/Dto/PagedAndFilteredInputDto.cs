using Infrastructure.Application.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Dto
{
    public class PagedAndFilteredInputDto : PagedResultRequestDto
    {
        public string Filter { get; set; }
    }
}
