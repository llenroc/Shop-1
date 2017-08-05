using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wechats.AutoReplys.Dto
{
    public class AutoReplyForCreateOrEditInput
    {
        public  AutoReplyForCreateOrEditDto AutoReply { get; set; }
        public List<AutoReplyArticleForCreateOrEditDto> Articles { get; set; }
    }
}
