using Application.Authorization.Users;
using Application.Group.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using Infrastructure.Linq.Extensions;
using System.Linq;

namespace Application.Group
{
    public class GroupAppService:
        CrudAppServiceBase<User,CustomerDto,long, CustomerGetAllInput,EntityDto<long>,EntityDto<long>>,
        IGroupAppService
    {
        public GroupAppService(IRepository<User, long> repository) :base(repository)
        {

        }

        public PagedResultDto<CustomerDto> GetCustomers(CustomerGetAllInput input)
        {
            var query = Repository.GetAll().WhereIf(input.Depth == 1, model => model.ParentUserId == InfrastructureSession.UserId.Value)
                .WhereIf(input.ShouldBePotential,model=>model.IsSpreader==false)
                .WhereIf(input.Depth == 2, model => model.ParentUserId.HasValue && model.ParentUser.ParentUserId == InfrastructureSession.UserId.Value)
                .WhereIf(input.Depth == 3, model => model.ParentUserId.HasValue && model.ParentUser.ParentUserId.HasValue && model.ParentUser.ParentUser.ParentUserId == InfrastructureSession.UserId.Value);
            var totalCount = query.Count();
            query = ApplySorting(query, input);
            query = ApplyPaging(query, input);

            var entities = query.ToList();

            return new PagedResultDto<CustomerDto>(
                totalCount,
                input.PageIndex,
                input.PageSize,
                entities.Select(MapToEntityDto).ToList()
            );
        }
    }
}
