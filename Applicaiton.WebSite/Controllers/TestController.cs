using Application.Authorization.Users;
using Application.Orders.Entities;
using Infrastructure.Domain.Repositories;
using System.Threading.Tasks;
using System.Web.Mvc;
using System;

namespace Application.WebSite.Controllers
{
    public class TestController : AnonymousHomeControllerBase
    {
        public IRepository<User, long> UserRepository { get; set; }
        public IRepository<Order> OrderRepository { get; set; }

        // GET: Test
        public async Task<ActionResult> Index()
        {
            return Content("Ok");
        }
    }
}