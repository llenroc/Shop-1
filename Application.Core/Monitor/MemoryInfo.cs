using System.Runtime.InteropServices;
using System.Text;

namespace Application.Monitor
{
    /// <summary>
    /// 获取内存信息
    /// </summary>
    public class MemoryInfo
    {

        //定义内存的信息结构
        [StructLayout(LayoutKind.Sequential)]
        public struct MEMORY_INFO
        {
            public uint dwLength;
            public uint dwMemoryLoad;
            public uint dwTotalPhys;
            public uint dwAvailPhys;
            public uint dwTotalPageFile;
            public uint dwAvailPageFile;
            public uint dwTotalVirtual;
            public uint dwAvailVirtual;
        }

        /// <summary>
        /// kernel32.dll是Windows9x/Me中非常重要的32位动态链接库文件，属于内核级文件。
        　　　　 ///它控制着系统的内存管理、数据的输入输出操作和中断处理，当Windows启动时，kernel32.dll就驻留在内存中特定的写保护区域，使别的程序无法占用这个内存区域。
        /// </summary>

        [DllImport("kernel32")]
        private static extern void GetWindowsDirectory(StringBuilder WinDir, int count);

        [DllImport("kernel32")]
        private static extern void GetSystemDirectory(StringBuilder SysDir, int count);

        [DllImport("kernel32")]
        private static extern void GlobalMemoryStatus(ref MEMORY_INFO meminfo);

        /// <summary>
        /// 获取内存信息
        /// </summary>
        /// <returns></returns>
        public static uint GetMemInfo()
        {
            //调用GlobalMemoryStatus函数获取内存的相关信息
            MEMORY_INFO MemInfo = new MEMORY_INFO();
            GlobalMemoryStatus(ref MemInfo);
            return MemInfo.dwMemoryLoad;
        }
    }
}
