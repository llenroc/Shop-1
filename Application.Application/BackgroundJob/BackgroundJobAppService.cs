using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.Application.DTO;
using Application.BackgroundJob.Dto;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Domain.Repositories;
using Infrastructure.BackgroundJobs;
using Infrastructure.AutoMapper;
using Infrastructure.Application.Services;
using Infrastructure.Authorization;
using Application.Authorization;

namespace Application.BackgroundJob
{
    [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostBackgroundJobs)]
    public class BackgroundJobAppService: CrudAppService<BackgroundJobInfo, BackgroundJobListDto, long>,IBackgroundJobAppService
    {
        private readonly IRepository<BackgroundJobInfo, long> _backgroundJobRepository;

        public BackgroundJobAppService(IRepository<BackgroundJobInfo, long> backgroundJobRepository):base(backgroundJobRepository)
        {
            _backgroundJobRepository = backgroundJobRepository;
        }
    }
}
