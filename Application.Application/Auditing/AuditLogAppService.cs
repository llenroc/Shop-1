using Application.Auditing.Dto;
using Application.Authorization;
using Application.Authorization.End.Users.Dto;
using Application.Authorization.Users;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.Auditing;
using Infrastructure.Authorization;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.UnitOfWork;
using Infrastructure.Linq.Extensions;
using System.Collections.Generic;
using System.Linq;

namespace Application.Auditing
{
    [InfrastructureAuthorize(AppPermissions.PagesAdministrationHostAudtiLogs)]
    public class AuditLogAppService : CrudAppService<AuditLog, AuditLogDto, long, AuditLogGetAllInput>, IAuditLogAppService
    {
        private IRepository<User, long> _userRepository;
        private readonly INamespaceStripper _namespaceStripper;

        public AuditLogAppService(
            IRepository<AuditLog, long> auditInfoRepository,
            IRepository<User, long> userRepository,
            INamespaceStripper namespaceStripper) :
            base(auditInfoRepository)
        {
            _userRepository = userRepository;
            _namespaceStripper = namespaceStripper;
        }

        protected override IQueryable<AuditLog> CreateFilteredQuery(AuditLogGetAllInput input)
        {
            return Repository.GetAll()
                .WhereIf(string.IsNullOrEmpty(input.ServiceName) == false, model => model.ServiceName == input.ServiceName)
                .WhereIf(string.IsNullOrEmpty(input.MethodName) == false, model => model.MethodName == input.MethodName)
                .WhereIf(input.ExecutionTime != null, model => model.ExecutionTime == input.ExecutionTime)
                .WhereIf(input.ExecutionDuration != null, model => model.ExecutionDuration == input.ExecutionDuration)
                .WhereIf(string.IsNullOrEmpty(input.ClientIpAddress) == false, model => model.ClientIpAddress == input.ClientIpAddress)
                .WhereIf(string.IsNullOrEmpty(input.ClientName) == false, model => model.ClientName == input.ClientName)
                .WhereIf(string.IsNullOrEmpty(input.BrowserInfo) == false, model => model.BrowserInfo == input.BrowserInfo)
                .WhereIf(input.UserId != null, model => model.UserId == input.UserId);
        }

        public PagedResultDto<AuditLogDto> GetAuditLogs(AuditLogGetAllInput input)
        {
            using (CurrentUnitOfWork.DisableFilter(DataFilters.MayHaveTenant))
            {
                var pagedResultDto = GetAllOfPage(input);
                pagedResultDto.Items = ConvertToAuditLogListDtos(pagedResultDto.Items);
                return pagedResultDto;
            }
        }

        public AuditLogDto GetAuditLog(AuditLogDto input)
        {
            using (CurrentUnitOfWork.DisableFilter(DataFilters.MayHaveTenant))
            {
                var auditLogDto = Get(input);
                auditLogDto = ConvertToAuditLogListDto(auditLogDto);
                return auditLogDto;
            } 
        }

        private List<AuditLogDto> ConvertToAuditLogListDtos(IReadOnlyList<AuditLogDto> items)
        {
            return items.Select(ConvertToAuditLogListDto).ToList();
        }

        private AuditLogDto ConvertToAuditLogListDto(AuditLogDto auditLogDto)
        {
            auditLogDto.User = auditLogDto.UserId == null ? null : _userRepository.Get(auditLogDto.UserId.Value).MapTo<UserListDto>();
            auditLogDto.ServiceName = _namespaceStripper.StripNameSpace(auditLogDto.ServiceName);
            return auditLogDto;
        }
    }
}