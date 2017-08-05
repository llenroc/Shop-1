using Infrastructure.Domain.Entities;

namespace Application.Entities
{
    public interface IUserIdentifierEntity : IMustHaveTenant
    {
        long UserId { get; set; }
    }
}
