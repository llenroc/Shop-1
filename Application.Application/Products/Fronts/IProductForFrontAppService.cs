using Application.Products.Fronts.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;

namespace Application.Products.Fronts
{
    public interface IProductForFrontAppService: IApplicationService
    {
        ListResultDto<SpecificationWithProductDto> GetSpecificationForAgentOrder();

        ListResultDto<ProductListDto> Gets(ProductGetsInput input);

        PagedResultDto<ProductListDto> GetScoreExchangeProductsOfPage(ProductGetAllInput input);

        ProductDto GetProduct(ProductGetInput input);

        PagedResultDto<ProductListDto> GetAllOfPage(PagedAndSortedResultRequestDto input);

        PagedResultDto<ProductCommentDto> GetComments(ProductCommentGetAllInput input);
    }
}
