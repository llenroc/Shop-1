using Senparc.Weixin.MP.AdvancedAPIs.TemplateMessage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wechats.TemplateMessages.TemplateMessageDatas
{
    public class OrderCreatedTemplateMessageData : TemplateMessageData
    {
        public TemplateDataItem orderno { get; set; }
        public TemplateDataItem refundno { get; set; }
        public TemplateDataItem refundproduct { get; set; }

        public OrderCreatedTemplateMessageData(
            TemplateDataItem first,
            TemplateDataItem orderno, 
            TemplateDataItem refundno,
            TemplateDataItem refundproduct,
            TemplateDataItem remark):base(first, remark)
        {
            this.orderno = orderno;
            this.refundno = refundno;
            this.refundproduct = refundproduct;
        }
    }
}
