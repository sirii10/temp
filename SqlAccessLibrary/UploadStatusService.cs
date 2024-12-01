using System.Data;
using Microsoft.EntityFrameworkCore;
using SqlAccessLibrary.SQL;

namespace SqlAccessLibrary;

public class UploadStatusService
{
    private readonly IDbContextFactory<IscDatabaseContext> _applicationDbContextFactory;

        public UploadStatusService(IDbContextFactory<IscDatabaseContext> applicationDbContext)
        {
            _applicationDbContextFactory = applicationDbContext;
        }

        public async Task<UploadStatus?> InsertStatus(string fileName)
        {
            try
            {
                using var dbContext = _applicationDbContextFactory.CreateDbContext();
                UploadStatus status = new UploadStatus()
                {
                    Progress = 0,
                    Status = "NEW",
                    FileName = fileName,
                    Last_Updated = DateTime.Now
                };
             
                 dbContext.UploadStatus.Add(status);
                 dbContext.SaveChanges();
                return status;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return null;
            }
        }
        
        public async Task<UploadStatus> UpdateStatus(UploadStatus status)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.UploadStatus.Update(status);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return null;
            }
            return status;
        }
        
        public async Task<List<UploadStatus>> GetAllUpdateStatus()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                return await dbContext.UploadStatus.ToListAsync();
            }
            catch (Exception)
            {
                //TODO: improve handling
                return null;
            }
            
        }
}

        

        

