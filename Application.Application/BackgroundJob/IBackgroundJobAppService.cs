using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Application.BackgroundJob.Dto;

namespace Application.BackgroundJob
{
    public interface IBackgroundJobAppService: ICrudAppService<BackgroundJobListDto, long>
    {
    }
}
