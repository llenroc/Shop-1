using System.Linq;
using Infrastructure.Configuration;
using Infrastructure.Localization;
using Infrastructure.Net.Mail;
using Application.EntityFramework;

namespace Application.Migrations.SeedData
{
    public class DefaultSettingsCreator
    {
        private readonly ApplicationDbContext _context;

        public DefaultSettingsCreator(ApplicationDbContext context)
        {
            _context = context;
        }

        public void Create()
        {
            //Emailing
            AddSettingIfNotExists(EmailSettingNames.DefaultFromAddress, "canknow@canknow.com");
            AddSettingIfNotExists(EmailSettingNames.DefaultFromDisplayName, "canknow");

            //Languages
            AddSettingIfNotExists(LocalizationSettingNames.DefaultLanguage, "en");
        }

        private void AddSettingIfNotExists(string name, string value, int? tenantId = null)
        {
            if (_context.Settings.Any(s => s.Name == name && s.TenantId == tenantId && s.UserId == null))
            {
                return;
            }
            _context.Settings.Add(new Setting(tenantId, null, name, value));
            _context.SaveChanges();
        }
    }
}