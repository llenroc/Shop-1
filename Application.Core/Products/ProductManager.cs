using Application.Distributions;
using Infrastructure.Domain.Repositories;
using Infrastructure.Domain.Services;
using System;

namespace Application.Products
{
    public class ProductManager : DomainService
    {
        private IRepository<Distribution> _distributionRespository;
        private IRepository<Specification> _specificationRespository;

        public ProductManager(
            IRepository<Specification> specificationRespository,
            IRepository<Distribution> distributionRespository)
        {
            _specificationRespository = specificationRespository;
            _distributionRespository = distributionRespository;
        }

        public void CheckStock(Specification specification, int count)
        {
            if (specification.Stock<=0)
            {
                throw new ApplicationException(L("UnderStock"));
            }

            if (specification.Stock < count)
            {
                throw new ApplicationException(L("UnderStock"));
            }
        }

        public void DecreaseStock(Specification specification,int count)
        {
            specification.Stock -= count;
            _specificationRespository.Update(specification);
        }

        public void IncreaseSale(Specification specification, int count)
        {
            specification.Sale += count;
            _specificationRespository.Update(specification);
        }
    }
}
