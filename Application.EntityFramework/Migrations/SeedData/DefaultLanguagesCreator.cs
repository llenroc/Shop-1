using System.Collections.Generic;
using System.Linq;
using Infrastructure.Localization;
using Application.EntityFramework;

namespace Application.Migrations.SeedData
{
    public class DefaultLanguagesCreator
    {
        public static List<ApplicationLanguage> InitialLanguages { get; private set; }

        private readonly ApplicationDbContext _context;

        static DefaultLanguagesCreator()
        {
            InitialLanguages = new List<ApplicationLanguage>
            {
                new ApplicationLanguage(null, "en", "English", "culture-flag-gb"),
                new ApplicationLanguage(null, "zh-CN", "简体中文", "culture-flag-cn"),
            };
        }

        public DefaultLanguagesCreator(ApplicationDbContext context)
        {
            _context = context;
        }

        public void Create()
        {
            CreateLanguages();
        }

        private void CreateLanguages()
        {
            foreach (var language in InitialLanguages)
            {
                AddLanguageIfNotExists(language);
            }
        }

        private void AddLanguageIfNotExists(ApplicationLanguage language)
        {
            if (_context.Languages.Any(l => l.TenantId == language.TenantId && l.Name == language.Name))
            {
                return;
            }
            _context.Languages.Add(language);
            _context.SaveChanges();
        }
    }
}
