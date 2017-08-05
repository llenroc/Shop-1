using Infrastructure.AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Application.DTO;
using Senparc.Weixin.MP;

namespace Application.Wechats.AutoReplys.Dto
{
    [AutoMap(typeof(AutoReply))]
    public class AutoReplyForCreateOrEditDto:NullableIdDto
    {
        public RequestType RequestType { get; set; }

        public ResponseMsgType MsgType { get; set; }

        public string Name { get; set; }

        public int Sort { get; set; }

        public string Key { get; set; }

        public MatchingType MatchingType { get; set; } = MatchingType.Fuzzy;

        public string Content { get; set; }

        public string MediaId { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public string MusicUrl { get; set; }

        public string HQMusicUrl { get; set; }

        public string ThumbMediaId { get; set; }
    }
}
