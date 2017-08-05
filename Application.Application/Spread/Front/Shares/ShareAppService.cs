using Application.Spread.Front.Shares.Dto;
using Application.Spread.Shares;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.Domain.Repositories;
using System.Linq;

namespace Application.Spread.Front.Shares
{
    public class ShareAppService :
        CrudAppService<Share, ShareDto,int,PagedAndSortedResultRequestDto,ShareForCreateInput,ShareDto>,
        IShareAppService
    {
        public ShareAppService(IRepository<Share> respository) :base(respository)
        {

        }

        protected override IQueryable<Share> CreateFilteredQuery(PagedAndSortedResultRequestDto input)
        {
            return Repository.GetAll().Where(model=>model.CreatorUserId==InfrastructureSession.UserId.Value);
        }

        public PreShareOutput GetPreShare()
        {
            PreShareOutput preShareOutput = new PreShareOutput();
            preShareOutput.No = Application.Spread.Shares.Share.CreateNo();
            return preShareOutput;
        }

        public ShareDto Share(ShareForCreateInput shareForCreateInput)
        {
            ShareDto share = Create(shareForCreateInput);
            return share;
        }
    }
}
