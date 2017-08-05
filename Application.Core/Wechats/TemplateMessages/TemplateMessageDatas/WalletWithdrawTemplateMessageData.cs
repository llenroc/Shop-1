using Senparc.Weixin.MP.AdvancedAPIs.TemplateMessage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wechats.TemplateMessages.TemplateMessageDatas
{
    public class WalletWithdrawTemplateMessageData : TemplateMessageData
    {
        public TemplateDataItem keyword1 { get; set; }

        public TemplateDataItem keyword2 { get; set; }

        public WalletWithdrawTemplateMessageData(
            TemplateDataItem first,
            TemplateDataItem keyword1,
            TemplateDataItem keyword2,
            TemplateDataItem remark) : base(first, remark)
        {
            this.keyword1 = keyword1;
            this.keyword2 = keyword2;
        }
    }
}
