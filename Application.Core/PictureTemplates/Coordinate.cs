using System.ComponentModel.DataAnnotations.Schema;

namespace Application.PictureTemplates
{

    [ComplexType]
    public class Coordinate
    {
        public int Width { get; set; }

        public int Height { get; set; }

        public int StartX { get; set; }

        public int StartY { get; set; }
    }
}
