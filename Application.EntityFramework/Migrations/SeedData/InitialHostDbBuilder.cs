using Application.EntityFramework;
using EntityFramework.DynamicFilters;

namespace Application.Migrations.SeedData
{
    public class InitialHostDbBuilder
    {
        private readonly ApplicationDbContext _context;

        public InitialHostDbBuilder(ApplicationDbContext context)
        {
            _context = context;
        }

        public void Create()
        {
            _context.DisableAllFilters();

            new DefaultEditionsCreator(_context).Create();
            new DefaultLanguagesCreator(_context).Create();
            new HostRoleAndUserCreator(_context).Create();
            new DefaultSettingsCreator(_context).Create();
        }
    }
}
