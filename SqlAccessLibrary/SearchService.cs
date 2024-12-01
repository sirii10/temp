using Microsoft.EntityFrameworkCore;
using SqlAccessLibrary.SQL;

namespace SqlAccessLibrary
{
    public class SearchService
    {
        private readonly IDbContextFactory<IscDatabaseContext> _applicationDbContextFactory;

        public SearchService(IDbContextFactory<IscDatabaseContext> applicationDbContext)
        {
            _applicationDbContextFactory = applicationDbContext;
        }

        //Recording Search

        public async Task<List<RecordingSearch>> GetAllRecordingSearches()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var recordingSearches = await dbContext.RecordingSearches
                .Include(p => p.PerformanceRecordingId)
                .Include(p => p.AttributeId)
                .Include(p => p.DomainId)
                .Include(p => p.OriginatorId)
                .ToListAsync();
            return recordingSearches;
        }

        public async Task<bool> AddRecordingSearch(RecordingSearch recordingSearch)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.RecordingSearches.AddAsync(recordingSearch);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<RecordingSearch?> GetRecordingSearch(int recordingSearchId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.RecordingSearches
                .Include(p => p.PerformanceRecordingId)
                .Include(p => p.AttributeId)
                .Include(p => p.DomainId)
                .Include(p => p.OriginatorId)
                .FirstOrDefaultAsync(p => p.RecordingSearchId == recordingSearchId);
        }

        public async Task<bool> UpdateRecordingSearch(RecordingSearch recordingSearch)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.RecordingSearches.Update(recordingSearch);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteRecordingSearch(RecordingSearch recordingSearch)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(recordingSearch);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        //isc domains

        public async Task<List<IscDomain>> GetAllIscDomains()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var iscDomains = await dbContext.IscDomains
                .ToListAsync();
            return iscDomains;
        }

        public async Task<bool> AddIscDomains(IscDomain iscdomain)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.IscDomains.AddAsync(iscdomain);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<IscDomain?> GetIscDomain(int iscDomainIds)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.IscDomains
                .FirstOrDefaultAsync(p => p.DomainId == iscDomainIds);
        }

        public async Task<bool> UpdateIscDomain(IscDomain iscDomain)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.IscDomains.Update(iscDomain);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteIscDomain(IscDomain iscDomain)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(iscDomain);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<List<Originator>> GetIscDomainOriginators(int iscDomainId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.Originators
                .Include(p => p.DomainId)
                .Include(p => p.AttributeId)
                .Include(p => p.UserId)
                .Where(p => p.DomainId == iscDomainId).ToListAsync();
        }

        public async Task<List<Alias>> GetIscDomainAliases(int iscDomainId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.Aliases
                .Include(p => p.AttributeId)
                .Include(p => p.SubjectId)
                .Include(p => p.DomainId)
                .Include(p => p.KeywordId)
                .Where(p => p.DomainId == iscDomainId).ToListAsync();
        }

        public async Task<List<RecordingSearch>> GetIscDomainRecordingSearches(int iscDomainId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.RecordingSearches
                .Include(p => p.PerformanceRecordingId)
                .Include(p => p.AttributeId)
                .Include(p => p.DomainId)
                .Include(p => p.OriginatorId)
                .Where(p => p.DomainId == iscDomainId).ToListAsync();
        }

        //Performer Keywords

        public async Task<List<PerformerKeyword>> GetAllPerformerKeywords()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var performerKeywords = await dbContext.PerformerKeywords
                .Include(p => p.KeywordId)
                .ToListAsync();
            return performerKeywords;
        }

        public async Task<bool> AddPerformerKeyword(PerformerKeyword performerKeyword)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.PerformerKeywords.AddAsync(performerKeyword);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<PerformerKeyword?> GetPerformerKeyword(int performerKeyword)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.PerformerKeywords
                .Include(p => p.KeywordId)
                .FirstOrDefaultAsync(p => p.KeywordId == performerKeyword);
        }

        public async Task<bool> UpdatePerformerKeyword(PerformerKeyword perfomerKeyword)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.PerformerKeywords.Update(perfomerKeyword);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeletePerfomerKeyword(PerformerKeyword performerKeyword)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(performerKeyword);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        //Isc_Subjects
        public async Task<List<IscSubject>> GetAllIscSubjects()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var iscSubjects = await dbContext.IscSubjects
                .ToListAsync();
            return iscSubjects;
        }

        public async Task<bool> AddIscSubject(IscSubject iscSubject)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.IscSubjects.AddAsync(iscSubject);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<IscSubject?> GetIscSubject(int iscSubjectId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.IscSubjects
                .FirstOrDefaultAsync(p => p.SubjectId == iscSubjectId);
        }

        public async Task<bool> UpdateIscSubject(IscSubject iscSubject)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.IscSubjects.Update(iscSubject);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteIscSubject(IscSubject iscSubject)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(iscSubject);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<List<Alias>> GetIscSubjectAliases(int iscSubjectId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.Aliases
                .Include(p => p.SubjectId)
                .Include(p => p.AttributeId)
                .Include(p => p.DomainId)
                .Include(p => p.KeywordId)
                .Where(p => p.SubjectId == iscSubjectId).ToListAsync();
        }

        public async Task<List<Article>> GetIscSubjectArticles(int iscSubjectId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.Articles
                .Include(p => p.SubjectId)
                .Include(p => p.AttributeId)
                .Include(p => p.OriginatorId)
                .Include(p => p.UserId)
                .Where(p => p.SubjectId == iscSubjectId).ToListAsync();
        }

        //isc Attributes

        public async Task<List<IscAttribute>> GetAllIscAttributes()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var iscSubjects = await dbContext.IscAttributes
                .ToListAsync();
            return iscSubjects;
        }

        public async Task<bool> AddIscAttribute(IscAttribute iscAttribute)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.IscAttributes.AddAsync(iscAttribute);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<IscAttribute?> GetIscAttribute(int iscAttributes)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.IscAttributes
                .FirstOrDefaultAsync(p => p.AttributeId == iscAttributes);
        }

        public async Task<bool> UpdateIscAttribute(IscAttribute iscAttribute)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.IscAttributes.Update(iscAttribute);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteIscAttribute(IscAttribute iscAttribute)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(iscAttribute);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<List<Alias>> GetIscAttributeAliases(int iscAttributeId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.Aliases
                .Include(p => p.SubjectId)
                .Include(p => p.AttributeId)
                .Include(p => p.DomainId)
                .Include(p => p.KeywordId)
                .Where(p => p.AttributeId == iscAttributeId).ToListAsync();
        }

        public async Task<List<Article>> GetIscAttributeArticles(int iscAttributeId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.Articles
                .Include(p => p.SubjectId)
                .Include(p => p.AttributeId)
                .Include(p => p.OriginatorId)
                .Include(p => p.UserId)
                .Where(p => p.AttributeId == iscAttributeId).ToListAsync();
        }

        public async Task<List<RecordingSearch>> GetIscAttributeRecordingSearches(int iscAttributeId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.RecordingSearches
                .Include(p => p.PerformanceRecordingId)
                .Include(p => p.AttributeId)
                .Include(p => p.DomainId)
                .Include(p => p.OriginatorId)
                .Where(p => p.AttributeId == iscAttributeId).ToListAsync();
        }

        public async Task<List<Originator>> GetIscAttributeOriginators(int iscAttributeId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.Originators
                .Include(p => p.DomainId)
                .Include(p => p.AttributeId)
                .Include(p => p.UserId)
                .Where(p => p.AttributeId == iscAttributeId).ToListAsync();
        }

        //Performance Keywords

        public async Task<List<PerformanceKeyword>> GetAllPerformanceKeywords()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var performanceKeywords = await dbContext.PerformanceKeywords
                .Include(p => p.KeywordId)
                .Include(p => p.PerformanceId)
                .ToListAsync();
            return performanceKeywords;
        }

        public async Task<bool> AddPerformanceKeyword(PerformanceKeyword performanceKeyword)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.PerformanceKeywords.AddAsync(performanceKeyword);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<PerformanceKeyword?> GetPerformanceKeyword(int perfomanceKeywordId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.PerformanceKeywords
                .Include(p => p.KeywordId)
                .Include(p => p.PerformanceId)
                .FirstOrDefaultAsync(p => p.PerformanceKeywordId == perfomanceKeywordId);
        }

        public async Task<bool> UpdatePerformanceKeyword(PerformanceKeyword performanceKeyword)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.PerformanceKeywords.Update(performanceKeyword);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeletePerformanceKeyword(PerformanceKeyword performanceKeyword)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(performanceKeyword);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        //Event Keywords

        public async Task<List<EventKeyword>> GetAllEventKeywords()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var eventKeywords = await dbContext.EventKeywords
                .Include(p => p.KeywordId)
                .Include(p => p.EventId)
                .ToListAsync();
            return eventKeywords;
        }

        public async Task<bool> AddEventKeyword(EventKeyword eventKeyword)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.EventKeywords.AddAsync(eventKeyword);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<EventKeyword?> GetEventKeyword(int eventKeywordId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.EventKeywords
                .Include(p => p.KeywordId)
                .Include(p => p.EventId)
                .FirstOrDefaultAsync(p => p.EventKeywordId == eventKeywordId);
        }

        public async Task<bool> UpdateEventKeyword(EventKeyword eventKeyword)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.EventKeywords.Update(eventKeyword);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteEventKeyword(EventKeyword eventKeyword)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(eventKeyword);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        //Aliases

        public async Task<List<Alias>> GetAllAliases()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var aliases = await dbContext.Aliases
                .Include(p => p.AttributeId)
                .Include(p => p.SubjectId)
                .Include(p => p.DomainId)
                .Include(p => p.KeywordId)
                .ToListAsync();
            return aliases;
        }

        public async Task<bool> AddAlias(Alias alias)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.Aliases.AddAsync(alias);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<Alias?> GetAlias(int aliasId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.Aliases
                .Include(p => p.AttributeId)
                .Include(p => p.SubjectId)
                .Include(p => p.DomainId)
                .Include(p => p.KeywordId)
                .FirstOrDefaultAsync(p => p.AliasId == aliasId);
        }

        public async Task<bool> UpdateAlias(Alias alias)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Aliases.Update(alias);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteAlias(Alias alias)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(alias);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        //Keywords

        public async Task<List<Keyword>> GetAllKeywords()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var keywords = await dbContext.Keywords
                .ToListAsync();
            return keywords;
        }

        public async Task<bool> AddAlias(Keyword keyword)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.Keywords.AddAsync(keyword);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<Keyword?> GetKeyword(int keywordId)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.Keywords
                .FirstOrDefaultAsync(p => p.KeywordId == keywordId);
        }

        public async Task<bool> UpdateKeyword(Keyword keyword)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Keywords.Update(keyword);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteKeyword(Keyword keyword)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(keyword);
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
