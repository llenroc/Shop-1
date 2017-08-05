using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Domain.Entities.Auditing;
using Senparc.Weixin.MP;
using Infrastructure.Domain.Entities;
using System.ComponentModel.DataAnnotations;

namespace Application.Wechats.AutoReplys
{
    public enum RequestType
    {
        ImageRequest,
        LinkRequest,
        LocationRequest,
        ShortVideoRequest,
        TextRequest,
        VideoRequest,
        VoiceRequest,

        EventRequest,
        Event_ClickRequest,
        Event_ViewRequest,
        Event_SubscribeRequest,
        Event_UnsubscribeRequest,
        Event_ScanRequest,
        Event_LocationRequest,
    }

    public enum MatchingType
    {
        Exact,
        Fuzzy
    }

    public class AutoReply:FullAuditedEntity,IMustHaveTenant
    {
        public int TenantId { get; set; }

        [Required]
        public string Name { get; set; }

        public RequestType RequestType { get; set; }

        [Required]
        public ResponseMsgType MsgType { get; set; }

        public string Content { get; set; }

        public string Key { get; set; }

        public MatchingType MatchingType { get; set; }

        public string MediaId { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public string MusicUrl { get; set; }

        public string HQMusicUrl { get; set; }

        public string ThumbMediaId { get; set; }

        public int Sort { get; set; }

        public virtual ICollection<AutoReplyArticle> Articles { get; set; }
    }

    public class AutoReplyArticle:Entity
    {
        public int AutoReplyId { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Description { get; set; }

        [Required]
        public string PicUrl { get; set; }

        [Required]
        public string Url { get; set; }
    }
}
