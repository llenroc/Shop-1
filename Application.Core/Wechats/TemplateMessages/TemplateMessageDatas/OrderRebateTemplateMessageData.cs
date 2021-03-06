﻿using Senparc.Weixin.MP.AdvancedAPIs.TemplateMessage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wechats.TemplateMessages.TemplateMessageDatas
{
    public class OrderRebateTemplateMessageData : TemplateMessageData
    {
        public TemplateDataItem keyword1 { get; set; }
        public TemplateDataItem keyword2 { get; set; }
        public TemplateDataItem keyword3 { get; set; }
        public TemplateDataItem keyword4 { get; set; }

        public OrderRebateTemplateMessageData(
            TemplateDataItem first,
            TemplateDataItem keyword1,
            TemplateDataItem keyword2,
            TemplateDataItem keyword3,
            TemplateDataItem keyword4,
            TemplateDataItem remark):base(first, remark)
        {
            this.keyword1 = keyword1;
            this.keyword2 = keyword2;
            this.keyword3 = keyword3;
            this.keyword4 = keyword4;
        }
    }
}
