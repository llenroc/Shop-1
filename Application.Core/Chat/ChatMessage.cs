using Infrastructure;
using Infrastructure.Domain.Entities;
using Infrastructure.Domain.Entities.Auditing;
using Infrastructure.Timing;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Chat
{
    [Table("AppChatMessages")]
    public class ChatMessage : Entity<long>, IHasCreationTime, IMayHaveTenant
    {
        public const int MaxMessageLength = 4 * 1024; //4KB

        public long UserId { get; set; }

        public int? TenantId { get; set; }

        public long TargetUserId { get; set; }

        public int? TargetTenantId { get; set; }

        [Required]
        [StringLength(MaxMessageLength)]
        public string Message { get; set; }

        public DateTime CreationTime { get; set; }

        public ChatSide Side { get; set; }

        public ChatMessageReadState ReadState { get; private set; }

        public ChatMessage(
            UserIdentifier user,
            UserIdentifier targetUser,
            ChatSide side,
            string message,
            ChatMessageReadState readState)
        {
            UserId = user.UserId;
            TenantId = user.TenantId;
            TargetUserId = targetUser.UserId;
            TargetTenantId = targetUser.TenantId;
            Message = message;
            Side = side;
            ReadState = readState;

            CreationTime = Clock.Now;
        }

        public void ChangeReadState(ChatMessageReadState newState)
        {
            ReadState = newState;
        }

        protected ChatMessage()
        {

        }
    }
}
