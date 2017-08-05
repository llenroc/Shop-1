using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Orders.NumberProviders
{
    public class DefaultNumberProvider : INumberProvider
    {
        public static object _lock = new object();
        public static int count = 1;
        public string BuildNumber()
        {
            lock (_lock)
            {
                Random random = new Random();
                return "U" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + random.Next(1000, 9999).ToString();
            }
        }
    }
}
