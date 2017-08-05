using Infrastructure.Dependency;
using Infrastructure.IO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Application
{
    public class AppFolderHelper:ISingletonDependency
    {
        public AppFolders AppFolders { get; set; }

        public string GetUserResourcePath(long userId)
        {
            string userResourceFolderBase = AppFolders.UserResourceFolderBase;
            string userResourceFolder = userResourceFolderBase + userId;
            DirectoryHelper.CreateIfNotExists(HttpContext.Current.Server.MapPath(userResourceFolder));
            return userResourceFolder;
        }
    }
}
