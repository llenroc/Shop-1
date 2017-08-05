using Application.Wechats.AutoReplys.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wechats.AutoReplys.Dto
{
    public interface IAutoReplyAppService : ICrudAppService<AutoReplyDto>
    {
        AutoReplyForCreateOrEditInput GetAutoReplyForCreateOrEdit(NullableIdDto input);
        void CreateOrEdit(AutoReplyForCreateOrEditInput input);
    }
}
