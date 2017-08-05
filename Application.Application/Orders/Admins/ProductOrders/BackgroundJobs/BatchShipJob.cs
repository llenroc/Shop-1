using Application.IO;
using Application.Orders.Admins.ProductOrders.Dto;
using Application.Products.Orders;
using Infrastructure.BackgroundJobs;
using Infrastructure.Dependency;
using System.Collections.Generic;
using System.Linq;

namespace Application.Orders.Admins.ProductOrders.BackgroundJobs
{
    public class BatchShipJob : BackgroundJob<BatchShipJobArgs>, ITransientDependency
    {
        public ExcelHelper ExcelHelper { get; set; }
        public ProductOrderManager OrderManager { get; set; }

        public override void Execute(BatchShipJobArgs batchShipJobArgs)
        {
            List<OrderOfBatchShipInput> orderOfBatchShipInputs = ExcelHelper.LoadFromExcel<OrderOfBatchShipInput>(batchShipJobArgs.FilePath).ToList();

            foreach (OrderOfBatchShipInput orderOfBatchShipInput in orderOfBatchShipInputs)
            {
                OrderManager.Ship(orderOfBatchShipInput.Number, orderOfBatchShipInput.ExpressCompany, orderOfBatchShipInput.TrackingNumber);
            }
        }
    }
}