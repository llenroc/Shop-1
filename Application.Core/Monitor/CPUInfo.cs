using System.Diagnostics;

namespace Application.Monitor
{
    /// <summary>
    /// 获取CPU信息
    /// </summary>
    public class CPUInfo
    {
        /// <summary>
        /// 输出CPU信息
        /// </summary>
        /// <returns></returns>
        public static float GetCPUInfo()
        {
            return GetCPUCounter();
        }

        /// <summary>
        /// 获取CPU信息
        /// </summary>
        /// <returns></returns>
        private static float GetCPUCounter()
        {
            PerformanceCounter pc = new PerformanceCounter();
            pc.CategoryName = "Processor";
            pc.CounterName = "% Processor Time";
            pc.InstanceName = "_Total";

            try
            {
                dynamic Value_1 = pc.NextValue();
                System.Threading.Thread.Sleep(1000);
                dynamic Value_2 = pc.NextValue();
                return Value_2;
            }
            catch
            {
                return 0;
            }
            finally
            {

            }
            
        }
    }
}
