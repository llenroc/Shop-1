using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Application.Services;
using Infrastructure.Authorization.Users;
using Infrastructure.Application.DTO;
using Infrastructure.Domain.Repositories;
using Application.UserLoginAttempts.Dto;

namespace Application.UserLoginAttempts
{
    public class UserLoginAttemptsAppService : CrudAppService<UserLoginAttempt, UserLoginAttemptDto, long>, IUserLoginAttemptsAppService
    {
        public UserLoginAttemptsAppService(IRepository<UserLoginAttempt, long> userLoginAttemptRepository)
            :base(userLoginAttemptRepository)
        {
        }

        protected override IQueryable<UserLoginAttempt> CreateFilteredQuery(PagedAndSortedResultRequestDto input)
        {
            return Repository.GetAll().Where(model=>model.UserId==InfrastructureSession.UserId.Value);
        }
    }
}
