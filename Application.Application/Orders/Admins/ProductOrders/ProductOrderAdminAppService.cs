using Application.Expresses;
using Application.Expresses.Dto;
using Application.IO;
using Application.Orders.Admins.Common;
using Application.Orders.Admins.Dto;
using Application.Orders.Admins.Exporting;
using Application.Orders.Admins.ProductOrders.Dto;
using Application.Orders.Entities;
using Application.Products.Orders;
using Application.Products.Orders.Entities;
using Infrastructure.Application.DTO;
using Infrastructure.Application.Services;
using Infrastructure.AutoMapper;
using Infrastructure.BackgroundJobs;
using Infrastructure.Domain.Repositories;
using Infrastructure.Linq.Extensions;
using Infrastructure.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Application.Admins.Orders
{
    public class ProductOrderAdminAppService:
        CrudAppService<
            ProductOrder,
            ProductOrderDto,
            int,
            OrderGetAllInput,
            OrderCreateOrUpdateInput,
            OrderEditInput, 
            OrderGetInput, 
            OrderGetInput>
        , IProductOrderAdminAppService
    {
        protected IRepository<ExpressCompany> ExpressCompanyRepository;
        protected IRepository<OrderCustomerInfo> OrderCustomerInfoRepository;
        public ProductOrderManager OrderManager { get; set; }
        public ExcelHelper ExcelHelper { get; set; }
        public OrderListExcelExporter OrderListExcelExporter { get; set; }
        private readonly IBackgroundJobManager _backgroundJobManager;

        public ProductOrderAdminAppService(
            IBackgroundJobManager backgroundJobManager,
            IRepository<ProductOrder> repository,
            IRepository<OrderCustomerInfo> orderCustomerInfoRepository,
            IRepository<ExpressCompany> expressCompanyRepository) : base(repository)
        {
            _backgroundJobManager = backgroundJobManager;
            ExpressCompanyRepository = expressCompanyRepository;
            OrderCustomerInfoRepository = orderCustomerInfoRepository;
        }

        protected override IQueryable<ProductOrder> CreateFilteredQuery(OrderGetAllInput input)
        {
            return Repository.GetAll()
                .WhereIf(input.OrderStatus!=null, model=>model.OrderStatus == input.OrderStatus)
                .WhereIf(input.StartTime!=null,model=>model.CreationTime>=input.StartTime)
                .WhereIf(input.EndTime != null, model => model.CreationTime <= input.EndTime)
                .WhereIf(!String.IsNullOrEmpty(input.TrackingNumber),model=>model.TrackingNumber==input.TrackingNumber)
                .WhereIf(!String.IsNullOrEmpty(input.FullName),model=>model.OrderCustomerInfo.FullName==input.FullName)
                .WhereIf(!String.IsNullOrEmpty(input.PhoneNumber),model=>model.OrderCustomerInfo.PhoneNumber==input.PhoneNumber);
        }

        public void ChangePayMoney(ChangePayMoneyOrderInput input)
        {
            ProductOrder order = Repository.Get(input.Id);
            order.PayMoney = input.PayMoney;
            order.PrepayId = null;
            order.PrepayIdCreatedTime = null;
            Repository.Update(order);
        }

        public void ChangeCustomerInfo(ChangeCustomerInfoInput input)
        {
            OrderCustomerInfo orderCustomerInfo = OrderCustomerInfoRepository.GetAll().Where(model => model.Id == input.Id).FirstOrDefault();
            orderCustomerInfo.DetailAddress = input.DetailAddress;
            orderCustomerInfo.AddressId = input.AddressId;
            orderCustomerInfo.FullName = input.FullName;
            orderCustomerInfo.PhoneNumber = input.PhoneNumber;
            OrderCustomerInfoRepository.Update(orderCustomerInfo);
        }

        public FileDto GetOrdersToExcel()
        {
            var orders = Repository.GetAll().Where(model => model.IsNeedShip && model.OrderStatus == OrderStatus.UnShip).ToList();

            if (orders.Count() == 0)
            {
                throw new UserFriendlyException(L("ThereIsNoOrderToShip"));
            }
            var ordersForExport= orders.MapTo<List<ProductOrderForExportDto>>();
            return OrderListExcelExporter.ExportToFile(ordersForExport);
        }

        public void BathShipFromExcel(BatchShipInput input)
        {
            List<OrderOfBatchShipInput> orderOfBatchShipInputs = ExcelHelper.LoadFromExcel<OrderOfBatchShipInput>(HttpContext.Current.Server.MapPath(input.FilePath)).ToList();

            foreach (OrderOfBatchShipInput orderOfBatchShipInput in orderOfBatchShipInputs)
            {
                OrderManager.Ship(orderOfBatchShipInput.Number, orderOfBatchShipInput.ExpressCompany, orderOfBatchShipInput.TrackingNumber);
            }
            //_backgroundJobManager.Enqueue<BatchShipJob, BatchShipJobArgs>(new BatchShipJobArgs(HttpContext.Current.Server.MapPath(input.FilePath)));
        }

        public ProductOrderForEditOutput GetOrderForEditOutput(OrderGetInput input)
        {
            ProductOrderForEditOutput orderForEditOutput = new ProductOrderForEditOutput()
            {
                Order=Repository.Get(input.Id).MapTo<ProductOrderDto>()
            };
            return orderForEditOutput;
        }

        public OrderForShipOutput GetOrderForShipOutput(OrderGetInput input)
        {
            OrderForShipOutput orderForEditOutput = new OrderForShipOutput()
            {
                Order = Repository.Get(input.Id).MapTo<ProductOrderDto>(),
                ExpressCompanys = ExpressCompanyRepository.GetAll().MapTo<List<ExpressCompanyDto>>()
            };
            return orderForEditOutput;
        }

        public void Ship(ShipOrderInput input)
        {
            ProductOrder order = Repository.Get(input.OrderId);

            try
            {
                OrderManager.Ship(order, false, input.ExpressInfo);
            }
            catch(Exception exception)
            {
                throw new UserFriendlyException(exception.Message);
            }
        }

        public async Task SetAsPayed(OrderGetInput input)
        {
            ProductOrder order = Repository.Get(input.Id);
            await OrderManager.PayedAsync(order,Wallets.Entities.PayType.WeChat);
        }

        public async Task Refund(IdInput input)
        {
            ProductOrder order = Repository.Get(input.Id);

            try
            {
                await OrderManager.Refund(order, order.PayMoney);
            }
            catch(Exception exception)
            {
                throw new UserFriendlyException(exception.Message, exception);
            }
        }
    }
}
