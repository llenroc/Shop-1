using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utility.Drawing
{
    public class ColorHelper
    {
        /// <summary>
        /// [颜色：16进制转成RGB]
        /// </summary>
        /// <param name="strColor">设置16进制颜色 [返回RGB]</param>
        /// <returns></returns>
        public static Color colorHx16toRGB(string strHxColor)
        {
            try
            {
                if (strHxColor.Length == 0){
                    //如果为空
                    return System.Drawing.Color.FromArgb(0, 0, 0);//设为黑色
                }
                else
                {
                    //转换颜色
                    return Color.FromArgb(System.Int32.Parse(strHxColor.Substring(1, 2),
                        System.Globalization.NumberStyles.AllowHexSpecifier),
                        System.Int32.Parse(strHxColor.Substring(3, 2), System.Globalization.NumberStyles.AllowHexSpecifier),
                        System.Int32.Parse(strHxColor.Substring(5, 2), System.Globalization.NumberStyles.AllowHexSpecifier));
                }
            }
            catch
            {
                //设为黑色
                return System.Drawing.Color.FromArgb(0, 0, 0);
            }
        }

        /// <summary>
        /// [颜色：RGB转成16进制]
        /// </summary>
        /// <param name="R">红 int</param>
        /// <param name="G">绿 int</param>
        /// <param name="B">蓝 int</param>
        /// <returns></returns>
        public static string colorRGBtoHx16(Color color)
        {
            if (color.IsEmpty)
                return "#000000";
            return ColorTranslator.ToHtml(color);
        }

        /// <summary>
        /// [颜色：RGB转成16进制]
        /// </summary>
        /// <param name="color">颜色</param>
        /// <returns>十六进制值，如果参数为空，默认返回#000000</returns>
        private static string ToHexColor(Color color)
        {
            if (color.IsEmpty)
                return "#000000";

            string R = Convert.ToString(color.R, 16);

            if (R == "0")
                R = "00";
            string G = Convert.ToString(color.G, 16);

            if (G == "0")
                G = "00";
            string B = Convert.ToString(color.B, 16);

            if (B == "0")
                B = "00";
            string HexColor = "#" + R + G + B;
            return HexColor.ToUpper();
        }
    }
}
