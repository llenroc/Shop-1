using System;

namespace Application.BackgroundJob
{
    [Serializable]
    public class SimpleSendEmailJobArgs
    {
        public long SenderUserId { get; set; }

        public long TargetUserId { get; set; }

        public string Subject { get; set; }

        public string Body { get; set; }
    }
}
