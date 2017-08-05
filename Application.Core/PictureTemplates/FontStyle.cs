using System.ComponentModel.DataAnnotations.Schema;

namespace Application.PictureTemplates
{

    [ComplexType]
    public class FontStyle
    {
        public int Size { get; set; }

        public string Color { get; set; }

        public string FontFamly { get; set; }
    }
}
