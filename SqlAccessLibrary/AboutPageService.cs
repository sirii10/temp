using Microsoft.EntityFrameworkCore;
using SqlAccessLibrary.SQL;

namespace SqlAccessLibrary
{
    public class AboutPageService
    {
        private readonly IDbContextFactory<IscDatabaseContext> _applicationDbContextFactory;

        public AboutPageService(IDbContextFactory<IscDatabaseContext> applicationDbContext)
        {
            _applicationDbContextFactory = applicationDbContext;
        }

        public async Task<List<AboutPage>> GetAllAboutPages()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var aboutPages = await dbContext.AboutPages
            .Include(p => p.FeaturedArticles)
            .ToListAsync();
            return aboutPages;
        }

        public async Task<bool> AddAboutPage(AboutPage aboutPage)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.AboutPages.AddAsync(aboutPage);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<AboutPage?> GetAboutPage(int id)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var aboutPage = await dbContext.AboutPages
            .Include(p => p.FeaturedArticles).FirstOrDefaultAsync(p => p.AboutPageId == id);
            if (aboutPage == null) { return null; }
            return aboutPage;
        }

        public async Task<bool> UpdateAboutPage(AboutPage aboutPage)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.AboutPages.Update(aboutPage);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteAboutPage(AboutPage aboutPage)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(aboutPage);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }
    }
}
