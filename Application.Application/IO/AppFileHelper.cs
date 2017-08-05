using Infrastructure.IO;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Application.IO
{
    public static class AppFileHelper
    {
        public static IEnumerable<string> ReadLines(string path)
        {
            using (var fileStream = new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.ReadWrite, 0x1000, FileOptions.SequentialScan))
            using (var streamReader = new StreamReader(fileStream, Encoding.UTF8))
            {
                string line;

                while ((line = streamReader.ReadLine()) != null)
                {
                    yield return line;
                }
            }
        }

        public static void DeleteFilesInFolderIfExists(string folderPath, string fileNameWithoutExtension)
        {
            var directory = new DirectoryInfo(folderPath);
            var tempUserProfileImages = directory.GetFiles(fileNameWithoutExtension + ".*", SearchOption.AllDirectories).ToList();

            foreach (var tempUserProfileImage in tempUserProfileImages)
            {
                FileHelper.DeleteIfExists(tempUserProfileImage.FullName);
            }
        }
    }
}
