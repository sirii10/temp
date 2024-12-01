using Microsoft.EntityFrameworkCore;
using SqlAccessLibrary.SQL;

namespace SqlAccessLibrary
{
    public class PerformanceService
    {
        private readonly IDbContextFactory<IscDatabaseContext> _applicationDbContextFactory;

        public PerformanceService(IDbContextFactory<IscDatabaseContext> applicationDbContext)
        {
            _applicationDbContextFactory = applicationDbContext;
        }

        //Performers
        public async Task<List<Performer>> GetAllPerformers()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var performers = await dbContext.Performers
                .Include(p => p.EventPerformers)
                .Include(p => p.PerformancePerformers)
                .Include(p => p.PerformerBiographies)
                .Include(p => p.PerformerImages)
                .Include(p => p.PerformerNames)
                .Include(p => p.PerformerKeywords)
                .ToListAsync();
            return performers;
        }

        public async Task<Performer?> GetPerformer(int performerId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.Performers
                .Include(p => p.EventPerformers)
                .Include(p => p.PerformancePerformers)
                .Include(p => p.PerformerBiographies)
                .Include(p => p.PerformerImages)
                .Include(p => p.PerformerNames)
                .Include(p => p.PerformerKeywords)
                .FirstOrDefaultAsync(p => p.PerformerId == performerId);
        }

        public async Task<bool> UpdatePerformer(Performer performer)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Performers.Update(performer);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeletePerformer(Performer performer)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(performer);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        //Performances
        public async Task<List<Performance>> GetAllPerformances()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var performances = await dbContext.Performances.ToListAsync();
            return performances;
        }

        public async Task<Performance?> GetPerformance(int performanceId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.Performances
                .Include(p => p.EventPerformances)
                .Include(p => p.PerformanceKeywords)
                .Include(p => p.PerformancePerformers)
                .Include(p => p.PerformanceRecordings)
                .FirstOrDefaultAsync(p => p.PerformanceId == performanceId);
        }
        
        public async Task<List<Performance>> GetPerformanceList()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.Performances
                .Include(p => p.EventPerformances)
                .Include(p => p.PerformanceKeywords)
                .Include(p => p.PerformancePerformers)
                .ThenInclude(p => p.Performer)
                .ThenInclude((p => p.PerformerNames))
                .Include(p => p.PerformanceRecordings)
                .ThenInclude(p => p.TranscriptionRecordings).ToListAsync();
        }

        public async Task<List<PerformancePerformer>> GetPerformancePerformers(int performanceId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.PerformancePerformers.Where(p => p.PerformanceId == performanceId).ToListAsync();
        }

        public async Task<List<PerformanceRecording>> GetPerformanceRecordings(int performanceId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.PerformanceRecordings
                .Include(p => p.PerformanceId)
                .Where(p => p.PerformanceId == performanceId).ToListAsync();
        }

        public async Task<List<PerformanceKeyword>> GetPerformanceKeywords(int performanceId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.PerformanceKeywords
                .Include(p => p.PerformanceId)
                .Include(p => p.KeywordId)
                .Where(p => p.PerformanceId == performanceId).ToListAsync();
        }

        public async Task<List<EventPerformance>> GetPerformanceEventPerformances(int performanceId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.EventPerformances
                .Include(p => p.PerformanceId)
                .Include(p => p.EventId)
                .Where(p => p.PerformanceId == performanceId).ToListAsync();
        }

        public async Task<bool> AddPerformance(Performance performance)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.Performances.AddAsync(performance);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<bool> RemovePerformance(Performance performance)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(performance);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> UpdatePerformance(Performance performance)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Performances.Update(performance);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        //TranscriptionRecording

        public async Task<List<TranscriptionRecording>> GetAllTranscriptionRecordings()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var recordings = await dbContext.TranscriptionRecordings
                .Include(p => p.TranscriptionId)
                .Include(p => p.PerformanceRecordingId).ToListAsync();
            return recordings;
        }

        public async Task<bool> AddTranscriptionRecording(TranscriptionRecording transcriptionRecording)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.TranscriptionRecordings.AddAsync(transcriptionRecording);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<TranscriptionRecording?> GetTranscriptionRecording(int transcriptionRecordingId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.TranscriptionRecordings
                .FirstOrDefaultAsync(p => p.TranscriptionRecordingId == transcriptionRecordingId);
        }

        public async Task<bool> UpdateTranscriptionRecording(TranscriptionRecording transcriptionRecording)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.TranscriptionRecordings.Update(transcriptionRecording);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteTranscriptionRecording(TranscriptionRecording transcriptionRecording)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(transcriptionRecording);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        //Performance Recording

        public async Task<List<PerformanceRecording>> GetAllPerformanceRecordings()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var recordings = await dbContext.PerformanceRecordings
                .Include(p => p.PerformanceId).ToListAsync();
            return recordings;
        }

        public async Task<bool> AddPerformanceRecording(PerformanceRecording performanceRecording)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.PerformanceRecordings.AddAsync(performanceRecording);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<PerformanceRecording?> GetPerformanceRecording(int performanceRecordingId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.PerformanceRecordings
                .Include(p => p.TranscriptionRecordings)
                .FirstOrDefaultAsync(p => p.PerformanceRecordingId == performanceRecordingId);
        }

        public async Task<bool> UpdatePerformanceRecording(PerformanceRecording performanceRecording)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.PerformanceRecordings.Update(performanceRecording);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeletePerformanceRecording(PerformanceRecording performanceRecording)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(performanceRecording);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        //Performance Performers

        public async Task<List<PerformancePerformer>> GetAllPerformancePerformers()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var recordings = await dbContext.PerformancePerformers.ToListAsync();
            return recordings;
        }

        public async Task<bool> AddPerformancePerformer(PerformancePerformer performancePerformer)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.PerformancePerformers.AddAsync(performancePerformer);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<PerformancePerformer?> GetPerformancePerformer(int performancePerfomerId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.PerformancePerformers.FirstOrDefaultAsync(p => p.PerformancePerformerId == performancePerfomerId);
        }

        public async Task<bool> UpdatePerformancePerformer(PerformancePerformer performancePerformer)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.PerformancePerformers.Update(performancePerformer);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeletePerformancePerformance(PerformancePerformer performerPerformance)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(performerPerformance);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        //Transcription_SRT

        public async Task<List<TranscriptionSrt>> GetAllTranscriptionSRTs()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var transcriptionSRTs = await dbContext.TranscriptionSrts.ToListAsync();
            return transcriptionSRTs;
        }

        public async Task<TranscriptionSrt?> GetTranscriptionSRT(int transcriptionSRTId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.TranscriptionSrts
                .FirstOrDefaultAsync(p => p.TranscriptionId == transcriptionSRTId);
        }

        public async Task<bool> AddTranscriptionSRT(TranscriptionSrt transcriptionSRT)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.TranscriptionSrts.AddAsync(transcriptionSRT);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<bool> RemoveTranscriptionSRT(TranscriptionSrt transcriptionSRT)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(transcriptionSRT);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> UpdateTranscriptionSRT(TranscriptionSrt transcriptionSRT)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.TranscriptionSrts.Update(transcriptionSRT);
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