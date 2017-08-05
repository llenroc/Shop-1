using Application.ProductCategorys.Fronts.Dto;
using Application.Products;
using Application.Products.Fronts.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using Infrastructure.Linq.Extensions;
using System.Collections.Generic;
using System.Linq;

namespace Application.ProductCategorys.Tenants
{
    public class ProductCategoryForFrontAppService :IApplicationService, IProductCategoryForFrontAppService
    {
        private IRepository<ProductCategory> _productCategoryRespository;
        private IRepository<Product> _productRespository;

        public ProductCategoryForFrontAppService(IRepository<ProductCategory> productCategoryRespository, IRepository<Product> productRespository) 
        {
            _productCategoryRespository = productCategoryRespository;
            _productRespository = productRespository;
        }

        public ProductsWithProductCategoryPagedResultOutput GetProductsWithProductCategoryOfPage(ProductsWithProductCategoryPagedResultInput input)
        {
            ProductsWithProductCategoryPagedResultOutput output = new ProductsWithProductCategoryPagedResultOutput();
            output.ProductCategory= _productCategoryRespository.Get(input.ProductCategoryId).MapTo<ProductCategoryDto>();
            output.TotalCount = _productRespository.GetAll().Where(model => model.ProductCategoryId == input.ProductCategoryId).Count();
            output.Items = _productRespository.GetAll().Where(model => model.ProductCategoryId == input.ProductCategoryId).OrderByDescending(model=>model.CreationTime).PageBy(input).ToList().MapTo<List<ProductListDto>>();
            return output;
        }

        public ListResultDto<ProductCategoryDto> Gets()
        {
            List<ProductCategory> productCategories = _productCategoryRespository.GetAll().ToList();
            return new ListResultDto<ProductCategoryDto>(productCategories.MapTo<List<ProductCategoryDto>>());
        }

        public ProductCategoryWithProductListDto GetProductCategoryWithProducts(GetProductCategoryWithProductsInput input)
        {
            ProductCategoryWithProductListDto productCategoryWithProductList = _productCategoryRespository.Get(input.Id).MapTo<ProductCategoryWithProductListDto>();
            productCategoryWithProductList.Products = _productRespository.GetAll().Where(model => model.ProductCategoryId == input.Id).ToList().MapTo<List<ProductListDto>>();
            return productCategoryWithProductList;
        }
    }
}
