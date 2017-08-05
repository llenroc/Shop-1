using Application.Spread.Shares;
using Infrastructure.AutoMapper;
using System.ComponentModel.DataAnnotations;

namespace Application.Spread.Front.Shares.Dto
{
    [AutoMapTo(typeof(Share))]
    public class ShareForCreateInput
    {
        [Required]
        public string No { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Link { get; set; }

        public string ImgUrl { get; set; }

        public string Desc { get; set; }
    }
}
