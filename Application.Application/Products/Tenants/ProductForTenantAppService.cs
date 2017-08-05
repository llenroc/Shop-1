using Application.CustomerInfos;
using Application.Distributions;
using Application.ProductCategorys;
using Application.ProductCategorys.Tenants.Dto;
using Application.Products.Tenants.Dto;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.Domain.Repositories;
using Infrastructure.Linq.Extensions;
using System.Collections.Generic;
using System.Linq;
using Utility.Common;

namespace Application.Products.Tenants
{
    public class ProductForTenantAppService
        :CrudAppService<Product,ProductDto,int,ProductGetAllInput>, 
        IProductForTenantAppService
    {
        public ProductManager ProductManager { get; set; }
        private IRepository<ProductProperty> _productPropertyRespository;
        private IRepository<ProductUnit> _productUnitRespository;
        private IRepository<ProductCategory> _productCategoryRespository;
        private IRepository<SpecificationProperty> _specificationPropertyRespository;
        private IRepository<SpecificationPropertyValue> _specificationPropertyValueRespository;
        private IRepository<Distribution> _distributionRespository;
        private IRepository<ChannelAgentProductDistribution> _channelAgentProductDistributionRespository;
        private IRepository<CustomCustomerInfo> _customCustomerInfoRespository;
        private IRepository<Specification> _specificationRespository;

        public ProductForTenantAppService(
            IRepository<Product> respository, 
            IRepository<ProductCategory> productCategoryRespository,
            IRepository<SpecificationProperty> specificationPropertyRespository,
            IRepository<SpecificationPropertyValue> specificationPropertyValueRespository,
            IRepository<Distribution> distributionRespository,
            IRepository<ChannelAgentProductDistribution> channelAgentProductDistributionRespository,
            IRepository<ProductProperty> productPropertyRespository,
            IRepository<ProductUnit> productUnitRespository,
            IRepository<CustomCustomerInfo> customCustomerInfoRespository,
            IRepository<Specification> specificationRespository) 
            :base(respository)
        {
            _productCategoryRespository = productCategoryRespository;
            _specificationPropertyRespository = specificationPropertyRespository;
            _specificationPropertyValueRespository = specificationPropertyValueRespository;
            _distributionRespository = distributionRespository;
            _channelAgentProductDistributionRespository = channelAgentProductDistributionRespository;
            _productPropertyRespository = productPropertyRespository;
            _productUnitRespository = productUnitRespository;
            _customCustomerInfoRespository = customCustomerInfoRespository;
            _specificationRespository = specificationRespository;
        }

        protected override IQueryable<Product> CreateFilteredQuery(ProductGetAllInput input)
        {
            return Repository.GetAll()
                .WhereIf(input.Name.HasValue(), model => model.Name==input.Name)
                .WhereIf(input.Type == "OnSale", model => model.Status == ProductStatus.On)
                .WhereIf(input.Type == "UnderTheShelf", model => model.Status == ProductStatus.Off);
        }


        public List<ProductCategoryDto> GetProductCategorys()
        {
            var entities = _productCategoryRespository.GetAll().ToList();
            return entities.Select(entity=>entity.MapTo<ProductCategoryDto>()).ToList();
        }

        private List<SpecificationPropertyDto> GetSpecificationProperty()
        {
            var entities = _specificationPropertyRespository.GetAll().ToList();
            return entities.Select(entity => entity.MapTo<SpecificationPropertyDto>()).ToList();
        }

        public ProductDto CreateOrEdit(ProductCreateOrEditInput input)
        {
            Product entity = null;

            if (input.Product.Id.HasValue)
            {
                CheckUpdatePermission();

                entity = GetEntityById(input.Product.Id.Value);
                ObjectMapper.Map(input.Product, entity);

                List<SpecificationProperty> specificationPropertys = new List<SpecificationProperty>();

                foreach (SpecificationProperty specificationProperty in entity.SpecificationPropertys)
                {
                    specificationPropertys.Add(_specificationPropertyRespository.Get(specificationProperty.Id));
                }
                entity.SpecificationPropertys = specificationPropertys;
                CurrentUnitOfWork.SaveChanges();
            }
            else
            {
                CheckCreatePermission();
                entity = input.Product.MapTo<Product>();

                List<SpecificationProperty> specificationPropertys = new List<SpecificationProperty>();

                foreach (SpecificationProperty specificationProperty in entity.SpecificationPropertys)
                {
                    specificationPropertys.Add(_specificationPropertyRespository.Get(specificationProperty.Id));
                }
                entity.SpecificationPropertys = specificationPropertys;

                Repository.Insert(entity);
                CurrentUnitOfWork.SaveChanges();
            }
            SetSpecifications(entity, input.Specifications);
            SetCustomCustomerInfos(entity, input.CustomCustomerInfos);
            SetProductProperties(entity, input.Properties);
            SetProductUnits(entity, input.ProductUnits);
            SetDistributions(entity, input.Distributions);
            SetChannelAgentProductDistributions(entity, input.ChannelAgentProductDistributions);
            return MapToEntityDto(entity);
        }

        public void OnProduct(IdInput input)
        {
            Product product = Repository.Get(input.Id);
            product.Status = ProductStatus.On;
            Repository.Update(product);
        }

        public void OffProduct(IdInput input)
        {
            Product product = Repository.Get(input.Id);
            product.Status = ProductStatus.Off;
            Repository.Update(product);
        }

        public void RemoveProperty(IdInput input)
        {
            var property = _productPropertyRespository.Get(input.Id);
            _productPropertyRespository.Delete(property);
        }

        public void RemoveProductUnit(IdInput input)
        {
            var productUnit = _productUnitRespository.Get(input.Id);
            _productUnitRespository.Delete(productUnit);
        }

        public void RemoveDistribution(IdInput input)
        {
            var distribution = _distributionRespository.Get(input.Id);
            _distributionRespository.Delete(distribution);
        }

        public void RemoveChannelAgentProductDistribution(IdInput input)
        {
            var distribution = _channelAgentProductDistributionRespository.Get(input.Id);
            _channelAgentProductDistributionRespository.Delete(distribution);
        }

        public void RemoveCustomCustomerInfo(IdInput input)
        {
            var customCustomerInfo = _customCustomerInfoRespository.Get(input.Id);
            _customCustomerInfoRespository.Delete(customCustomerInfo);
        }

        public void RemoveSpecification(IdInput input)
        {
            var specification = _specificationRespository.Get(input.Id);
            _specificationRespository.Delete(specification);
        }

        private void SetSpecifications(Product product, List<SpecificationForCreateOrEditInput> specifications)
        {
            foreach (var specification in specifications)
            {
                if (specification.Id.HasValue)
                {
                    var entity = _specificationRespository.Get(specification.Id.Value);
                    ObjectMapper.Map(specification, entity);
                    CurrentUnitOfWork.SaveChanges();
                    SetSpecificationPropertyValue(entity, specification.PropertyValues);
                }
                else
                {
                    var entity = specification.MapTo<Specification>();
                    entity.ProductId = product.Id;
                    _specificationRespository.Insert(entity);
                    CurrentUnitOfWork.SaveChanges();
                    SetSpecificationPropertyValue(entity, specification.PropertyValues);
                }
            }
        }

        private void SetSpecificationPropertyValue(Specification specification, 
            List<SpecificationPropertyValueForCreateOrEditDto> propertyValues)
        {
            foreach (SpecificationPropertyValueForCreateOrEditDto propertyValue in propertyValues)
            {
                if (propertyValue.Id.HasValue)
                {
                    var entity = _specificationPropertyValueRespository.Get(propertyValue.Id.Value);
                    ObjectMapper.Map(propertyValue, entity);
                    CurrentUnitOfWork.SaveChanges();
                }
                else
                {
                    var entity = propertyValue.MapTo<SpecificationPropertyValue>();
                    entity.SpecificationId = specification.Id;
                    _specificationPropertyValueRespository.Insert(entity);
                    CurrentUnitOfWork.SaveChanges();
                }
            }
        }

        private void SetProductUnits(Product product, List<ProductUnitCreateOrEditDto> productUnits)
        {
            if (productUnits == null)
            {
                return;
            }

            foreach (var productUnit in productUnits)
            {
                if (productUnit.Id.HasValue)
                {
                    var entity = _productUnitRespository.Get(productUnit.Id.Value);
                    ObjectMapper.Map(productUnit, entity);
                    CurrentUnitOfWork.SaveChanges();
                }
                else
                {
                    var entity = productUnit.MapTo<ProductUnit>();
                    entity.ProductId = product.Id;
                    _productUnitRespository.Insert(entity);
                    CurrentUnitOfWork.SaveChanges();
                }
            }
        }

        private void SetProductProperties(Product product, List<ProductPropertyCreateOrEditDto> productProperties)
        {
            if (productProperties == null)
            {
                return;
            }

            foreach (var productPropertie in productProperties)
            {
                if (productPropertie.Id.HasValue)
                {
                    var entity = _productPropertyRespository.Get(productPropertie.Id.Value);
                    ObjectMapper.Map(productPropertie, entity);
                    CurrentUnitOfWork.SaveChanges();
                }
                else
                {
                    var entity = productPropertie.MapTo<ProductProperty>();
                    entity.ProductId = product.Id;
                    _productPropertyRespository.Insert(entity);
                    CurrentUnitOfWork.SaveChanges();
                }
            }
        }

        private void SetDistributions(Product product,List<DistributionCreateOrEditInput> distributions)
        {
            if (distributions == null)
            {
                return;
            }

            foreach (var distribution in distributions)
            {
                if (distribution.Id.HasValue)
                {
                    var entity = _distributionRespository.Get(distribution.Id.Value);
                    ObjectMapper.Map(distribution, entity);
                    CurrentUnitOfWork.SaveChanges();
                }
                else
                {
                    var entity = distribution.MapTo<Distribution>();
                    entity.ProductId = product.Id;
                    _distributionRespository.Insert(entity);
                    CurrentUnitOfWork.SaveChanges();
                }
            }
        }

        private void SetChannelAgentProductDistributions(Product product, List<ChannelAgentProductDistributionCreateOrEditInput> distributions)
        {
            if (distributions == null)
            {
                return;
            }

            foreach (var distribution in distributions)
            {
                if (distribution.Id.HasValue)
                {
                    var entity = _channelAgentProductDistributionRespository.Get(distribution.Id.Value);
                    ObjectMapper.Map(distribution, entity);
                    CurrentUnitOfWork.SaveChanges();
                }
                else
                {
                    var entity = distribution.MapTo<ChannelAgentProductDistribution>();
                    entity.ProductId = product.Id;
                    _channelAgentProductDistributionRespository.Insert(entity);
                    CurrentUnitOfWork.SaveChanges();
                }
            }
        }

        private void SetCustomCustomerInfos(Product product, List<CustomCustomerInfoCreateOrEditInput> customCustomerInfos)
        {
            if (customCustomerInfos == null)
            {
                return;
            }

            foreach (var customCustomerInfo in customCustomerInfos)
            {
                if (customCustomerInfo.Id.HasValue)
                {
                    var entity = _customCustomerInfoRespository.Get(customCustomerInfo.Id.Value);
                    ObjectMapper.Map(customCustomerInfo, entity);
                    CurrentUnitOfWork.SaveChanges();
                }
                else
                {
                    var entity = customCustomerInfo.MapTo<CustomCustomerInfo>();
                    entity.ProductId = product.Id;
                    _customCustomerInfoRespository.Insert(entity);
                    CurrentUnitOfWork.SaveChanges();
                }
            }
        }

        public ProductForCreateOrEditOutput GetProductForCreateOrEdit(NullableIdDto input)
        {
            ProductForCreateOrEditOutputDto product = new ProductForCreateOrEditOutputDto();
            ProductForCreateOrEditOutput productForCreateOutput = new ProductForCreateOrEditOutput()
            {
                SpecificationPropertys = GetSpecificationProperty(),
                ProductCategorys = GetProductCategorys(),
                Product = product
            };

            if (input.Id.HasValue)
            {
                productForCreateOutput.Product = Repository.Get(input.Id.Value).MapTo<ProductForCreateOrEditOutputDto>();
                productForCreateOutput.Specifications=_specificationRespository.GetAll()
                    .Where(model => model.ProductId == input.Id.Value).ToList()
                    .Select(entity=>ObjectMapper.Map<SpecificationDto>(entity)).ToList();
                productForCreateOutput.Distributions = _distributionRespository.GetAll()
                    .Where(model => model.ProductId == input.Id.Value).ToList()
                    .Select(entity => ObjectMapper.Map<DistributionDto>(entity)).ToList();
                productForCreateOutput.ChannelAgentProductDistributions = _channelAgentProductDistributionRespository.GetAll()
                    .Where(model => model.ProductId == input.Id.Value).ToList()
                    .Select(entity => ObjectMapper.Map<ChannelAgentProductDistributionDto>(entity)).ToList();
                productForCreateOutput.Properties = _productPropertyRespository.GetAll()
                   .Where(model => model.ProductId == input.Id.Value).ToList()
                   .Select(entity => ObjectMapper.Map<ProductPropertyCreateOrEditDto>(entity)).ToList();
                productForCreateOutput.ProductUnits = _productUnitRespository.GetAll()
                 .Where(model => model.ProductId == input.Id.Value).ToList()
                 .Select(entity => ObjectMapper.Map<ProductUnitCreateOrEditDto>(entity)).ToList();
                productForCreateOutput.CustomCustomerInfos = _customCustomerInfoRespository.GetAll()
                  .Where(model => model.ProductId == input.Id.Value).ToList()
                  .Select(entity => ObjectMapper.Map<CustomCustomerInfoDto>(entity)).ToList();
            }
            return productForCreateOutput;
        }
    }
}
