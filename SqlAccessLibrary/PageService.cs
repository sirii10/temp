using SqlAccessLibrary.SQL;
using Microsoft.EntityFrameworkCore;

namespace SqlAccessLibrary
{
    public class PageService
    {
        private readonly IDbContextFactory<IscDatabaseContext> _applicationDbContextFactory;

        public PageService(IDbContextFactory<IscDatabaseContext> applicationDbContext)
        {
            _applicationDbContextFactory = applicationDbContext;
        }
        //Articles
        public async Task<List<Article>> GetAllArticles()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var articles = await dbContext.Articles
                .Include(p => p.ArticleImages).ToListAsync();
            return articles;
        }

        public async Task<Article?> GetArticle(int articleId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.Articles
                .Include(p => p.ArticleImages)
                .FirstOrDefaultAsync(p => p.ArticleId == articleId);
        }

        public async Task<List<ArticleImage>> GetArticleImages(Article article)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            await dbContext.ArticleImages.LoadAsync();
            return article.ArticleImages.ToList();
        }

        public async Task<bool> AddArticle(Article article)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.Articles.AddAsync(article);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<bool> RemoveArticle(Article artice)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(artice);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> UpdateArticle(Article artice)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Articles.Update(artice);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        //Article_Images
        public async Task<List<ArticleImage>> GetAllArticleImages()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var articleImages = await dbContext.ArticleImages
                .Include(p => p.ArticleId).ToListAsync();
            return articleImages;
        }

        public async Task<ArticleImage?> GetArticleImage(int articleImageId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.ArticleImages.Include(p => p.ArticleId)
                .FirstOrDefaultAsync(p => p.ArticleImageId == articleImageId);
        }

        public async Task<bool> AddArticleImage(ArticleImage article)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.ArticleImages.AddAsync(article);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<bool> RemoveArticleImage(ArticleImage articleImage)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(articleImage);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> UpdateArticleImage(ArticleImage articeImage)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.ArticleImages.Update(articeImage);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        //Originators
        public async Task<List<Originator>> GetAllOriginators()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var originators = await dbContext.Originators
                .Include(p => p.DomainId)
                .Include(p => p.AttributeId)
                .Include(p => p.UserId).ToListAsync();
            return originators;
        }

        public async Task<Originator?> GetOriginator(int originatorId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.Originators.Include(p => p.DomainId)
                .Include(p => p.AttributeId)
                .Include(p => p.UserId)
                .FirstOrDefaultAsync(p => p.OriginatorId == originatorId);
        }

        public async Task<bool> AddOriginator(Originator originator)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.Originators.AddAsync(originator);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<bool> RemoveOriginator(Originator originator)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(originator);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> UpdateOriginator(Originator originator)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Originators.Update(originator);
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