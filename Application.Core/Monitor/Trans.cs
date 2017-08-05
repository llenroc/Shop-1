using System;

namespace Application.Monitor
{
    /// <summary>
    /// 转换
    /// </summary>
    public class Trans
    {
        public static decimal ConvertBytes(string b, int iteration)
        {
            long iter = 1;
            for (int i = 0; i < iteration; i++)
                iter *= 1024;
            return Math.Round((Convert.ToDecimal(b)) / Convert.ToDecimal(iter), 2, MidpointRounding.AwayFromZero);
        }
    }
}
