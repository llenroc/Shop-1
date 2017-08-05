using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using Infrastructure.BackgroundJobs;
using System;

namespace Application.BackgroundJob.Dto
{
    [AutoMapFrom(typeof(BackgroundJobInfo))]
    public class BackgroundJobListDto:EntityDto<long>
    {
        public virtual string JobType { get; set; }

        public virtual string JobArgs { get; set; }

        public virtual short TryCount { get; set; }

        public virtual DateTime NextTryTime { get; set; }

        public virtual DateTime? LastTryTime { get; set; }

        public virtual bool IsAbandoned { get; set; }

        public virtual BackgroundJobPriority Priority { get; set; }
    }
}
