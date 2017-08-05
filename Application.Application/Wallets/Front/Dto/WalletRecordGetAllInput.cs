using Infrastructure.Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wallets.Front.Dto
{
    public class WalletRecordGetAllInput : PagedAndSortedResultRequestDto
    {
        public long UserId { get; set; }
    }
}
