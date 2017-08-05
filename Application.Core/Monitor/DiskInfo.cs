namespace Application.Monitor
{
    public class DiskInfo
    {
        /// <summary>
        /// 获取指定驱动器的空间总大小(单位为B) 
        /// 只需输入代表驱动器的字母即可 （大写） 
        /// </summary>
        /// <param name="str_HardDiskName"></param>
        /// <returns></returns>
        public static float GetHardDiskSpace(string str_HardDiskName)
        {
            float totalSize = new float();
            str_HardDiskName = str_HardDiskName + ":\\";
            System.IO.DriveInfo[] drives = System.IO.DriveInfo.GetDrives();

            foreach (System.IO.DriveInfo drive in drives)
            {
                if (drive.Name == str_HardDiskName)
                {
                    totalSize = drive.TotalSize / (1024 * 1024 * 1024);
                }
            }
            return totalSize;
        }

        public string GetHardDiskSpace()
        {
            string str_HardDiskName = "C";
            float totalSize = new float();
            str_HardDiskName = str_HardDiskName + ":\\";
            System.IO.DriveInfo[] drives = System.IO.DriveInfo.GetDrives();

            foreach (System.IO.DriveInfo drive in drives)
            {
                if (drive.Name == str_HardDiskName)
                {
                    totalSize = drive.TotalSize / (1024 * 1024 * 1024);
                }
            }
            string TotalSize = totalSize.ToString();
            return TotalSize;
        }

        /// <summary>
        /// 获取指定驱动器的剩余空间总大小(单位为B) 
        /// 只需输入代表驱动器的字母即可  
        /// </summary>
        /// <param name="str_HardDiskName"></param>
        /// <returns></returns>
        public string GetHardDiskFreeSpace(string str_HardDiskName)
        {
            long freeSpace = new long();
            string FreeSpace = "";
            str_HardDiskName = str_HardDiskName + ":\\";
            System.IO.DriveInfo[] drives = System.IO.DriveInfo.GetDrives();

            foreach (System.IO.DriveInfo drive in drives)
            {
                if (drive.Name == str_HardDiskName)
                {
                    freeSpace = drive.TotalFreeSpace / (1024 * 1024 * 1024);
                }
            }
            FreeSpace = freeSpace.ToString();
            return FreeSpace;
        }
    }
}
