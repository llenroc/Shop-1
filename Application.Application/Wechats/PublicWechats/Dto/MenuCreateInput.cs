using Infrastructure.AutoMapper;
using Senparc.Weixin.MP;
using Senparc.Weixin.MP.Entities.Menu;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Wechats.PublicWechats.Dto
{
    public class MenuCreateInput
    {
        public GetMenuResultFull ResultFull { get; set; }
        public MenuMatchRule MenuMatchRule { get; set; }
    }
}
