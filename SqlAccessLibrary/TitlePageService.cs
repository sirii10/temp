using Microsoft.EntityFrameworkCore;
using SqlAccessLibrary.SQL;

namespace SqlAccessLibrary
{
    public class TitlePageService
    {
        private readonly IDbContextFactory<IscDatabaseContext> _applicationDbContextFactory;

        public TitlePageService(IDbContextFactory<IscDatabaseContext> applicationDbContext)
        {
            _applicationDbContextFactory = applicationDbContext;
        }

        public async Task<List<TitlePage>> GetAllTitlePages()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var titlePages = await dbContext.TitlePages
                .Include(p => p.FeaturedEvents)
                .Include(p => p.FeaturedPerformers)
                .ToListAsync();
            return titlePages;
        }

        public async Task<bool> AddTitlePage(TitlePage titlePage)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.TitlePages.AddAsync(titlePage);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<TitlePage?> GetTitlePage(int id)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var titlePage = await dbContext.TitlePages
            .Include(p => p.FeaturedEvents)
            .Include(p => p.FeaturedPerformers).FirstOrDefaultAsync(p => p.TitlePageId == id);
            if (titlePage == null) { return null; }
            return titlePage;
        }

        public async Task<bool> UpdateTitlePage(TitlePage titlePage)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.TitlePages.Update(titlePage);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteTitlePage(TitlePage titlePage)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(titlePage);
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
