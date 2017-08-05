using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using Senparc.Weixin.MP;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wechats.AutoReplys.Dto
{
    [AutoMap(typeof(AutoReply))]
    public class AutoReplyDto:AuditedEntityDto
    {
        public RequestType RequestType { get; set; }

        public ResponseMsgType MsgType { get; set; }

        public string Name { get; set; }

        public string Key { get; set; }

        public MatchingType MatchingType { get; set; }

        public int Sort { get; set; }

        public string Content { get; set; }

        public string MediaId { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public string MusicUrl { get; set; }

        public string HQMusicUrl { get; set; }

        public string ThumbMediaId { get; set; }

        public virtual ICollection<AutoReplyArticleDto> Articles { get; set; }
    }

    [AutoMap(typeof(AutoReplyArticle))]
    public class AutoReplyArticleDto : EntityDto
    {
        public int AutoReplyId { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public string PicUrl { get; set; }

        public string Url { get; set; }
    }
}
