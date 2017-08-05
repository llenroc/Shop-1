using Application.IO;
using Application.VirtualProducts.VirtualCards.End.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using Infrastructure.Linq.Extensions;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Utility.Common;

namespace Application.VirtualProducts.VirtualCards.End
{
    public class VirtualCardAppService : 
        CrudAppService<VirtualCard, VirtualCardDto,int,VirtualCardGetAllInput>,
        IVirtualCardAppService
    {
        public ExcelHelper ExcelHelper { get; set; }

        public VirtualCardAppService(IRepository<VirtualCard> respository)
            :base(respository)
        {
        }

        protected override IQueryable<VirtualCard> CreateFilteredQuery(VirtualCardGetAllInput input)
        {
            var query= Repository.GetAll();
            query = query.WhereIf(input.Name.HasValue(), model => model.Name == input.Name)
                .WhereIf(input.Value.HasValue(), model => model.Value == input.Value)
                .WhereIf(input.Version.HasValue(), model => model.Version == input.Version)
                .WhereIf(input.CardNumber.HasValue(), model => model.CardNumber == input.CardNumber)
                .WhereIf(input.CardPassword.HasValue(), model => model.CardPassword == input.CardPassword)
                .WhereIf(input.Status.HasValue, model => model.Status == input.Status);
            return query;
        }

        public PagedResultDto<VirtualCardGroupOutput> GetVirtualCardGroups(VirtualCardGroupGetAllInput input)
        {
            var query =
                from virtualCard in Repository.GetAll()
                group virtualCard by virtualCard.Version into virtualCardGroup
                select new VirtualCardGroupOutput()
                {
                    Name=virtualCardGroup.FirstOrDefault().Name,
                    Value = virtualCardGroup.FirstOrDefault().Value,
                    ExpireDays = virtualCardGroup.FirstOrDefault().ExpireDays,
                    Remark = virtualCardGroup.FirstOrDefault().Remark,
                    Version = virtualCardGroup.FirstOrDefault().Version,
                    Count = virtualCardGroup.Count(),
                    CreationTime = virtualCardGroup.FirstOrDefault().CreationTime,
                };
            query = query.WhereIf(input.Name.HasValue(), model => model.Name == input.Name)
               .WhereIf(input.Value.HasValue(), model => model.Value == input.Value)
               .WhereIf(input.Version.HasValue(), model => model.Version == input.Version);

            var totalCount = query.Count();
            query = query.OrderByDescending(model => model.Version);
            query = query.PageBy(input);
            var entities = query.ToList();

            return new PagedResultDto<VirtualCardGroupOutput>(
                totalCount,
                input.PageIndex,
                input.PageSize,
                entities.Select(model=>model.MapTo<VirtualCardGroupOutput>()).ToList()
            );
        }

        public async Task ImportVirtualCard(VirtualCardImportInput input)
        {
            List<VirtualCardForImportInput> virtualCardForImportInputs = ExcelHelper.LoadFromExcel<VirtualCardForImportInput>(HttpContext.Current.Server.MapPath(input.FilePath)).ToList();
            List<VirtualCard> virtualCards = new List<VirtualCard>();
            string version = VirtualCard.CreateVersion();

            foreach (VirtualCardForImportInput virtualCardForImportInput in virtualCardForImportInputs)
            {
                var virtualCard= new VirtualCard()
                {
                    Name = input.Name,
                    Value = input.Value,
                    ExpireDays = input.ExpireDays,
                    Remark = input.Remark,
                    CardNumber = virtualCardForImportInput.CardNumber,
                    CardPassword = virtualCardForImportInput.CardPassword,
                    Version = version
                };
                Repository.Insert(virtualCard);
            }
        }
    }
}
