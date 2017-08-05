using Application.Regions.End.Dto;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using System.Linq;

namespace Application.Regions.End
{
    public class AddressForEndAppService : CrudAppService<Address, AddressDto,int, AddressGetAllInput, AddressDto, AddressUpdateDto>, 
        IAddressForEndAppService
    {
        public AddressForEndAppService(IRepository<Address> addressRepository):base(addressRepository)
        {
        }

        protected override IQueryable<Address> CreateFilteredQuery(AddressGetAllInput input)
        {
            return Repository.GetAll().Where(model=>model.ParentId==input.ParentId);
        }
    }
}
