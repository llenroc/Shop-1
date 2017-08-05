using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wechats.AutoReplys.Dto
{
    public class AutoReplyForCreateOrEditOutput
    {
        public AutoReplyForCreateOrEditDto AutoReply { get; set; }
        public ICollection<AutoReplyArticleForCreateOrEditDto> Articles { get; set; }
    }
}
