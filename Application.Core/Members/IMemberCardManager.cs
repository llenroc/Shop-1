using Infrastructure.Domain.Services;

namespace Application.Members
{
    public interface IMemberCardManager : IDomainService
    {
        MemberCard GetValidMemberCardOfUser(long UserId);
        MemberCard CreateMemberCard(MemberCardPackage memberCardPackage, long userId);
    }
}
