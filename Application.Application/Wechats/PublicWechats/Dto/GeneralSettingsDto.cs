using System.ComponentModel.DataAnnotations;

namespace Application.Wechats.PublicWechats.Dto
{
    public class GeneralSettingsDto
    {
        public string Token { get; set; }

        public string AppId { get; set; }

        public string Secret { get; set; }

        public string EncodingAESKey { get; set; }

        [MaxLength(128)]
        public string SubscribeLink { get; set; }
    }
}
