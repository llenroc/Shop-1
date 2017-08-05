using Application.IO;
using Application.Orders.Admins.ProductOrders.Dto;
using System.Collections.Generic;

namespace Application.Orders.Admins.Exporting
{
    public interface IOrderListExcelExporter
    {
        FileDto ExportToFile(List<ProductOrderForExportDto> orderListDtos);
    }
}
