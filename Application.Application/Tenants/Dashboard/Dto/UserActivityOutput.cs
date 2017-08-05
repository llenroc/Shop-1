using System.Collections.Generic;

namespace Application.Tenants.Dashboard.Dto
{
    public class UserActivityOutput
    {
        public List<CommonDateCount> TotalUsers { get; set; }

        public List<CommonDateCount> NewUsers { get; set; }
    }
}