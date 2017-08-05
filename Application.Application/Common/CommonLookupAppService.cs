using Application.Common.Dto;
using Application.Editions;
using Infrastructure.Application.DTO;
using Infrastructure.Authorization;
using Infrastructure.Collections.Extensions;
using Infrastructure.Extensions;
using Infrastructure.Linq.Extensions;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Common
{
    [InfrastructureAuthorize]
    public class CommonLookupAppService : ApplicationAppServiceBase, ICommonLookupAppService
    {
        private readonly EditionManager _editionManager;

        public CommonLookupAppService(EditionManager editionManager)
        {
            _editionManager = editionManager;
        }

        public async Task<ListResultDto<ComboboxItemDto>> GetEditionsForCombobox()
        {
            var editions = await _editionManager.Editions.ToListAsync();
            return new ListResultDto<ComboboxItemDto>(editions.Select(e => new ComboboxItemDto(e.Id.ToString(), e.DisplayName)).ToList());
        }

        public async Task<PagedResultDto<NameValueDto>> FindUsers(FindUsersInput input)
        {
            if (InfrastructureSession.TenantId != null)
            {
                //Prevent tenants to get other tenant's users.
                input.TenantId = InfrastructureSession.TenantId;
            }

            using (CurrentUnitOfWork.SetTenantId(input.TenantId))
            {
                var query = UserManager.Users
                    .WhereIf(
                        !input.Filter.IsNullOrWhiteSpace(),
                        u =>
                            u.Name.Contains(input.Filter) ||
                            u.Surname.Contains(input.Filter) ||
                            u.UserName.Contains(input.Filter) ||
                            u.EmailAddress.Contains(input.Filter)
                    );

                var userCount = await query.CountAsync();
                var users = await query
                    .OrderBy(u => u.Name)
                    .ThenBy(u => u.Surname)
                    .PageBy(input)
                    .ToListAsync();

                return new PagedResultDto<NameValueDto>(
                    userCount,
                    users.Select(u =>
                        new NameValueDto(
                            u.FullName + " (" + u.EmailAddress + ")",
                            u.Id.ToString()
                            )
                        ).ToList()
                    );
            }
        }

        public string GetDefaultEditionName()
        {
            return EditionManager.DefaultEditionName;
        }
    }
}
