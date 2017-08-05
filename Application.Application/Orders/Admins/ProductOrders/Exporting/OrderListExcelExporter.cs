using Application.IO;
using Application.Orders.Admins.ProductOrders.Dto;
using Infrastructure.Runtime.Session;
using Infrastructure.Timing.Timezone;
using System.Collections.Generic;

namespace Application.Orders.Admins.Exporting
{
    public class OrderListExcelExporter : EpPlusExcelExporterBase, IOrderListExcelExporter
    {
        private readonly ITimeZoneConverter _timeZoneConverter;
        private readonly IInfrastructureSession _infrastructureSession;

        public OrderListExcelExporter(
            ITimeZoneConverter timeZoneConverter,
            IInfrastructureSession infrastructureSession)
        {
            _timeZoneConverter = timeZoneConverter;
            _infrastructureSession = infrastructureSession;
        }

        public FileDto ExportToFile(List<ProductOrderForExportDto> orderListDtos)
        {
            return CreateExcelPackage(
                "OrderList.xlsx",
                excelPackage =>
                {
                    var sheet = excelPackage.Workbook.Worksheets.Add(L("Orders"));
                    sheet.OutLineApplyStyle = true;

                    AddHeader(
                        sheet,
                        L("Number"),
                        L("Title"),
                        L("Money"),
                        L("StatusText"),
                        L("NoteOfCustomer"),
                        L("ProductInfo"),
                        L("ShipStatus"),
                        L("FullName"),
                        L("PhoneNumber"),
                        L("Address"),
                        L("CreationTime"),
                        L("ExpressCompany"),
                        L("TrackingNumber")
                        );

                    AddObjects(
                        sheet,
                        2, 
                        orderListDtos,
                        _ => _.Number,
                        _ => _.Title,
                        _ => _.Money,
                        _ => L(_.StatusText),
                        _ => _.NoteOfCustomer,
                        _ => _.ProductInfo,
                        _ => L(_.ShipStatus.ToString()),
                        _ => _.OrderCustomerInfo.FullName,
                        _ => _.OrderCustomerInfo.PhoneNumber,
                        _ => _.OrderCustomerInfo.FullAddress,
                        _ => _.CreationTime.ToString("yyyy-MM-dd hh:mm:ss"),
                        _ => _.ExpressCompany,
                        _ => _.TrackingNumber
                        );

                    //Formatting cells
                    for (var i = 1; i <= 11;i ++)
                    {
                        sheet.Column(i).AutoFit();
                    }
                });
        }
    }
}
