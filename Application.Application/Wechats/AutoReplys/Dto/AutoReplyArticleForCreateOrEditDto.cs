using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wechats.AutoReplys.Dto
{
    [AutoMap(typeof(AutoReplyArticle))]
    public class AutoReplyArticleForCreateOrEditDto : NullableIdDto
    {
        public int? AutoReplyId { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public string PicUrl { get; set; }

        public string Url { get; set; }
    }
}
