using System.IO;
using System.Runtime.InteropServices;
using System.Text;

namespace Application.WebSite.Helpers
{
    public static class PathHelper
    {
        [DllImport("shlwapi.dll", CharSet = CharSet.Auto)]
        public static extern bool PathRelativePathTo(
              [Out] StringBuilder pszPath,
              string pszFrom,
              FileAttributes dwAttrFrom,
              string pszTo,
              FileAttributes dwAttrTo
       );

        public static string ToRelativePath(string basePath, string absolutePath)
        {
            StringBuilder path = new StringBuilder(260);
            PathRelativePathTo(path, basePath, FileAttributes.Normal,absolutePath, FileAttributes.Normal);

            string r = path.ToString();

            if (r.StartsWith(".\\"))
            {
                return r.Substring(2);
            }
            return r;
        }
    }
}