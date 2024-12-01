using Microsoft.EntityFrameworkCore;
using SqlAccessLibrary.SQL;

namespace SqlAccessLibrary
{
    public class EventService
    {
        private readonly IDbContextFactory<IscDatabaseContext> _applicationDbContextFactory;

        public EventService(IDbContextFactory<IscDatabaseContext> applicationDbContext)
        {
            _applicationDbContextFactory = applicationDbContext;
        }

        //Event Performances

        public async Task<List<EventPerformance>> GetAllEventPerformances()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var recordings = await dbContext.EventPerformances
                .Include(p => p.EventId)
                .Include(p => p.PerformanceId).ToListAsync();
            return recordings;
        }

        public async Task<bool> AddEventPerformances(EventPerformance eventPerformance)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.EventPerformances.AddAsync(eventPerformance);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<EventPerformance?> GetEventPerformance(int eventPerformanceId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.EventPerformances
                .Include(p => p.EventId)
                .Include(p => p.PerformanceId)
                .FirstOrDefaultAsync(p => p.EventPerformanceId == eventPerformanceId);
        }

        public async Task<bool> UpdateEventPerformance(EventPerformance eventPerformance)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.EventPerformances.Update(eventPerformance);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteEventPerformance(EventPerformance eventPerformance)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(eventPerformance);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        //Event Performers

        public async Task<List<EventPerformer>> GetAllEventPerformers()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var performers = await dbContext.EventPerformers
                .Include(p => p.EventId)
                .Include(p => p.Performer).ToListAsync();
            return performers;
        }

        public async Task<bool> AddEventPerformer(EventPerformer eventPerformer)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.EventPerformers.AddAsync(eventPerformer);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<EventPerformer?> GetEventPerformer(int eventPerformerId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.EventPerformers
                .FirstOrDefaultAsync(p => p.EventPerformerId == eventPerformerId);
        }

        public async Task<bool> UpdateEventPerformer(EventPerformer eventPerformer)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.EventPerformers.Update(eventPerformer);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteEventPerformer(EventPerformer eventPerformer)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(eventPerformer);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        //Events

        public async Task<List<Event>> GetAllEvents()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var events = await dbContext.Events.ToListAsync();
            return events;
        }

        public async Task<List<EventPerformer>> GetEventPerformers(int eventId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.EventPerformers
                .Where(p => p.EventPerformerId == eventId).ToListAsync();
        }

        public async Task<List<EventPerformance>> GetEventPerformances(int eventId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.EventPerformances
                .Include(p => p.EventId)
                .Include(p => p.PerformanceId)
                .Where(p => p.EventPerformanceId == eventId).ToListAsync();
        }

        public async Task<List<EventKeyword>> GetEventKeywords(int eventId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.EventKeywords
                .Include(p => p.EventId)
                .Include(p => p.KeywordId)
                .Where(p => p.EventId == eventId).ToListAsync();
        }

        public async Task<bool> AddEvent(Event evnt)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.Events.AddAsync(evnt);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<Event?> GetEvent(int eventPerformanceId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.Events
                .FirstOrDefaultAsync(p => p.EventId == eventPerformanceId);
        }

        public async Task<bool> UpdateEvent(Event evnt)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Events.Update(evnt);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteEvent(Event evnt)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(evnt);
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