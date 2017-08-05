using Senparc.Weixin.MP.AdvancedAPIs.TemplateMessage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wechats.TemplateMessages.TemplateMessageDatas
{
    public class TemplateMessageData
    {
        public TemplateDataItem first { get; set; }
        public TemplateDataItem remark { get; set; }

        public TemplateMessageData()
        {

        }

        public TemplateMessageData(TemplateDataItem first, TemplateDataItem remark)
        {
            this.first = first;
            this.remark = remark;
        }
    }
}
