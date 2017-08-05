using Application.ProductCategorys;
using Application.Products.Fronts.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using Infrastructure.Extensions;
using Infrastructure.Linq.Extensions;
using Infrastructure.UI;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic;

namespace Application.Products.Fronts
{
    public class ProductForFrontAppService:ApplicationAppServiceBase, IProductForFrontAppService
    {
        public IRepository<Specification> SpecificationRespository { get; set; }
        private IRepository<Product> _productRespository;
        private IRepository<ProductCategory> _productCategoryRespository;
        private IRepository<SpecificationProperty> _specificationPropertyRespository;
        private IRepository<ProductComment> _productCommentRespository;

        public ProductForFrontAppService(IRepository<Product> productRespository, 
            IRepository<ProductCategory> productCategoryRespository,
            IRepository<SpecificationProperty> specificationPropertyRespository,
            IRepository<ProductComment> productCommentRespository)
        {
            _productRespository = productRespository;
            _productCategoryRespository = productCategoryRespository;
            _specificationPropertyRespository = specificationPropertyRespository;
            _productCommentRespository = productCommentRespository;
        }

        public ListResultDto<SpecificationWithProductDto> GetSpecificationForAgentOrder()
        {
            var list= SpecificationRespository.GetAll()
                .Where(model =>model.Product.EnableAgentOrder&& model.Product.Status==ProductStatus.On)
                .ToList().MapTo<List<SpecificationWithProductDto>>();
            return new ListResultDto<SpecificationWithProductDto>(list);
        }

        public ListResultDto<ProductListDto> Gets(ProductGetsInput input)
        {
            List<Product> products;

            if (input.IsHot)
            {
                products = _productRespository.GetAll().Where(model => model.Status == ProductStatus.On&&model.Show).OrderByDescending(model => model.CreationTime).Take(input.MaxCount).ToList();
            }
            else if (input.ProductCategoryId.HasValue)
            {
                products = _productRespository.GetAll().Where(model=> model.Status == ProductStatus.On && model.Show && model.ProductCategoryId==input.ProductCategoryId).OrderByDescending(model => model.CreationTime).Take(input.MaxCount).ToList();
            }
            else
            {
                products = _productRespository.GetAll().Where(model => model.Status == ProductStatus.On && model.Show).OrderByDescending(model => model.CreationTime).Take(input.MaxCount).ToList();
            }
            return new ListResultDto<ProductListDto>(products.MapTo<List<ProductListDto>>());
        }

        public PagedResultDto<ProductListDto> GetScoreExchangeProductsOfPage(ProductGetAllInput input)
        {
            var query = _productRespository.GetAll().Where(model => model.ExchangeScore > 0 && model.Status == ProductStatus.On);
            var totalCount = query.Count();

            if (!string.IsNullOrEmpty(input.Sorting))
            {
                query.OrderBy(input.Sorting);
            }
            query.PageBy((input.PageIndex - 1) * input.PageSize, input.PageSize);
            var products = query.ToList().MapTo<List<ProductListDto>>();
            return new PagedResultDto<ProductListDto>(totalCount,input.PageIndex, input.PageSize, products.MapTo<List<ProductListDto>>());
        }

        private SpecificationPropertyGroupList GetSpecificationPropertyGroups(Product product)
        {
            SpecificationPropertyGroupList specificationPropertyGroups = new SpecificationPropertyGroupList();

            foreach (Specification specification in product.Specifications)
            {
                foreach (SpecificationPropertyValue specificationPropertyValue in specification.PropertyValues)
                {
                    PropertyValueDto specificationPropertyValueDto = specificationPropertyValue.MapTo<PropertyValueDto>();

                    if (specificationPropertyGroups.HasSpecificationProperty(specificationPropertyValue.SpecificationProperty))
                    {
                        var specificationPropertyGroup = specificationPropertyGroups.GetFromSpecificationProperty(specificationPropertyValue.SpecificationProperty);

                        if (!HasPropertyValueDto(specificationPropertyGroup.SpecificationPropertyValues,specificationPropertyValueDto))
                        {
                            specificationPropertyGroup.SpecificationPropertyValues.Add(specificationPropertyValueDto);
                        }
                    }
                    else
                    {
                        var specificationPropertyGroup = new SpecificationPropertyGroup()
                        {
                            SpecificationProperty = specificationPropertyValue.SpecificationProperty.MapTo<SpecificationPropertyDto>(),
                            SpecificationPropertyValues = new List<PropertyValueDto>()
                        };
                        specificationPropertyGroup.SpecificationPropertyValues.Add(specificationPropertyValueDto);
                        specificationPropertyGroups.Add(specificationPropertyGroup);
                    }
                }
            }
            return specificationPropertyGroups;
        }

        private bool HasPropertyValueDto(List<PropertyValueDto> list, PropertyValueDto propertyValueDto)
        {
            foreach (PropertyValueDto propertyValueDtoItem in list)
            {
                if (propertyValueDtoItem.Value == propertyValueDto.Value)
                {
                    return true;
                }
            }
            return false;
        }

        public ProductDto GetProduct(ProductGetInput input)
        {
            Product product = _productRespository.Get(input.Id);

            if (product.Status == ProductStatus.Off)
            {
                throw new UserFriendlyException(L("TheProductIsOff"));
            }
            ProductDto productDto= product.MapTo<ProductDto>();

            SpecificationPropertyGroupList SpecificationPropertyGroupList = GetSpecificationPropertyGroups(product);
            productDto.SpecificationPropertyGroups = SpecificationPropertyGroupList;
            return productDto;
        }

        public PagedResultDto<ProductCommentDto> GetComments(ProductCommentGetAllInput input)
        {
            var query = _productCommentRespository.GetAll().Where(model=>model.ProductId==input.ProductId);
            var totalCount = query.Count();

            //Try to sort query if available
            var sortInput = input as ISortedResultRequest;

            if (sortInput != null)
            {
                if (!sortInput.Sorting.IsNullOrWhiteSpace())
                {
                    query=query.OrderBy(sortInput.Sorting);
                }
            }

            //IQueryable.Task requires sorting, so we should sort if Take will be used.
            if (input is ILimitedResultRequest)
            {
                query = query.OrderByDescending(e => e.Id);
            }
            query = query.PageBy(input);
            var entities = query.ToList();

            return new PagedResultDto<ProductCommentDto>(
                totalCount,
                input.PageIndex,
                input.PageSize,
                entities.MapTo<List<ProductCommentDto>>()
            );
        }

        public PagedResultDto<ProductListDto> GetAllOfPage(PagedAndSortedResultRequestDto input)
        {
            var query=_productRespository.GetAll().Where(model=>model.Status==ProductStatus.On && model.Show);
            var totalCount = query.Count();

            if (!string.IsNullOrEmpty(input.Sorting))
            {
                query.OrderBy(input.Sorting);
            }
            query.PageBy((input.PageIndex - 1) * input.PageSize, input.PageSize);
            var products = query.ToList().MapTo<List<ProductListDto>>();

            return new PagedResultDto<ProductListDto>(
                totalCount,
                input.PageIndex,
                input.PageSize,
                products
            );
        }
    }
}
