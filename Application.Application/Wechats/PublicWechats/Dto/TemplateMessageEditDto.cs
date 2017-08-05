using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wechats.PublicWechats.Dto
{
    public class TemplateMessageEditDto
    {
        public string NewCustomer { get; set; }

        public string OrderCreated { get; set; }

        public string OrderPayed { get; set; }

        public string OrderShiped { get; set; }

        public string OrderRebate { get; set; }

        public string WalletWithdraw { get; set; }

        public string Upgrade { get; set; }
    }
}
