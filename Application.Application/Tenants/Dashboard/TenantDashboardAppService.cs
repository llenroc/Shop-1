using Application.Authorization;
using Application.Authorization.Users;
using Application.Orders.Entities;
using Application.Tenants.Dashboard.Dto;
using Application.Wallets.Entities;
using Infrastructure.Authorization;
using Infrastructure.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Application.Tenants.Dashboard
{
    [InfrastructureAuthorize(AppPermissions.PagesAdministrationTenant)]
    public class TenantDashboardAppService : ApplicationAppServiceBase, ITenantDashboardAppService
    {
        public IRepository<User, long> UserRepository { get; set; }
        public IRepository<Order> OrderRepository { get; set; }
        public IRepository<WalletRecord> WalletRecordRepository { get; set; }

        public DashboardOutput GetDashboardActivity()
        {
            DashboardOutput dashboardOutput = new DashboardOutput();
            DateTime yestoday = DateTime.Now.AddDays(-1);
            dashboardOutput.OrderCountToShip = OrderRepository.GetAll().Where(model => model.OrderStatus==OrderStatus.UnShip).Count();

            dashboardOutput.OrderCountOfYestoday = OrderRepository.GetAll().Where(model =>
            model.CreationTime.Year == yestoday.Year
            && model.CreationTime.Month == yestoday.Month
            && model.CreationTime.Day == yestoday.Day
            && model.PaymentStatus == PaymentStatus.Payed).Count();

            dashboardOutput.TradingVolumeOfYestoday=OrderRepository.GetAll().Where(model =>
            model.CreationTime.Year == yestoday.Year
            && model.CreationTime.Month == yestoday.Month
            && model.CreationTime.Day == yestoday.Day
            && model.PaymentStatus == PaymentStatus.Payed).Sum(model=> (decimal?)model.PayMoney).GetValueOrDefault();

            dashboardOutput.RebateOfYestoday = WalletRecordRepository.GetAll().Where(model =>
            model.CreationTime.Year == yestoday.Year
            && model.CreationTime.Month == yestoday.Month
            && model.CreationTime.Day == yestoday.Day
            && model.Type==WalletRecordType.Recharge).Sum(model => (decimal?)model.Money).GetValueOrDefault();

            DateTime startDateTime = DateTime.Now.AddDays(-30);
            
            dashboardOutput.UserActivity = new UserActivityOutput()
            {
                NewUsers = new List<CommonDateCount>()
            };
            dashboardOutput.OrderActivity = new OrderActivityOutput()
            {
                NewPayedOrders = new List<CommonDateCount>()
            };

            for (int i = 0; i < 30; i++)
            {
                DateTime dateTime = DateTime.Now.AddDays(i - 30);
                DateTime endDateTime = dateTime.AddDays(1);

                int userCount = UserRepository.GetAll().Where(model => model.CreationTime>=dateTime&&
                model.CreationTime<=endDateTime).Count();
                dashboardOutput.UserActivity.NewUsers.Add(new CommonDateCount()
                {
                    Date = dateTime.ToString("yyyy-MM-dd"),
                    Count = userCount
                });

                int orderCount = OrderRepository.GetAll().Where(model => model.CreationTime >= dateTime &&
                model.CreationTime <= endDateTime&& model.PaymentStatus == PaymentStatus.Payed).Count();
                dashboardOutput.OrderActivity.NewPayedOrders.Add(new CommonDateCount()
                {
                    Date = dateTime.ToString("yyyy-MM-dd"),
                    Count = orderCount
                });
            }
            return dashboardOutput;
        }
    }
}