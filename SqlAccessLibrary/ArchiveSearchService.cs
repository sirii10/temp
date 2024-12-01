using Microsoft.EntityFrameworkCore;
using MySqlConnector;
using SqlAccessLibrary.SQL;

namespace SqlAccessLibrary;

public class ArchiveSearchService
{
    private readonly IDbContextFactory<IscDatabaseContext> _applicationDbContextFactory;

    public ArchiveSearchService(IDbContextFactory<IscDatabaseContext> applicationDbContext)
    {
        _applicationDbContextFactory = applicationDbContext;
    }

    //WARNING: Under no circumstances should parameters tableName and columns should be user input. If this must be changed, ensure it is wrapped in a MySqlParameter
    public List<TEntity> SearchWithRelevance<TEntity>(string tableName, string[] columns, string userInputSearchText) where TEntity : class
    {
        var query = new MySqlParameter("userQuery1", userInputSearchText); //User Input search text could contain an SQL injection attack
        var query2 = new MySqlParameter("userQuery2", userInputSearchText);

        var columnString = String.Join(",", columns);

        string queryTemplate = $"SELECT *, MATCH({columnString}) AGAINST(@userQuery1 IN NATURAL LANGUAGE MODE) " +
            $"AS RELEVANCE FROM {tableName} WHERE MATCH({columnString}) " +
            "AGAINST(@userQuery2 IN NATURAL LANGUAGE MODE)";
        var context = _applicationDbContextFactory.CreateDbContext();
        //Using FromSQLRaw with user input is DANGEROUS. It is highly vulnerable to SQL Injection.
        //Ensure all user input is properly parametarized - if not, it could be a disaster https://learn.microsoft.com/en-us/ef/core/querying/sql-queries
        var searchResults = context.Set<TEntity>().FromSqlRaw(queryTemplate, query, query2).ToList();
        return searchResults;
    }

    public List<PerformanceSearchResult> SearchTranscriptionsWithRelevance(string userInputSearchText)
    {
        string[] transcriptionColumns = { "line_by_line" };
        var transcriptions = SearchWithRelevance<TranscriptionSearchResult>("transcription_srt", transcriptionColumns, userInputSearchText);
        var context = _applicationDbContextFactory.CreateDbContext();

        HashSet<(TranscriptionRecording, double)> transcriptionRecordings = new HashSet<(TranscriptionRecording, double)>();
        foreach (var transcription in transcriptions)
        {
            foreach (var item in context.TranscriptionRecordings.Where(p => p.TranscriptionId == transcription.transcription_id))
            {
                transcriptionRecordings.Add((item, transcription.relevance));
            }
        }

        HashSet<(PerformanceRecording, double)> performanceRecordings = new HashSet<(PerformanceRecording, double)>();
        foreach ((TranscriptionRecording, double) transcriptionRecording in transcriptionRecordings)
        {
            foreach (var item in context.PerformanceRecordings.Where(p => p.PerformanceRecordingId == transcriptionRecording.Item1.PerformanceRecordingId))
            {
                performanceRecordings.Add((item, transcriptionRecording.Item2));
            }
        }

        //TODO: make performanceID mandatory in database to avoid cast - until then this code is unsafe
        return performanceRecordings.Select(p => new PerformanceSearchResult((int)p.Item1.PerformanceId, p.Item2)).ToList();
    }

    public List<PerformanceSearchResult> SearchPerformanceNamesWithRelevance(string userInputSearchText)
    {
        string[] performanceColumns = { "name" };
        return SearchWithRelevance<PerformanceSearchResult>("performances", performanceColumns, userInputSearchText);
    }

    public List<EventSearchResult> SearchEventsWithRelevance(string userInputSearchText)
    {
        string[] eventColumns = { "name", "description" };
        return SearchWithRelevance<EventSearchResult>("events", eventColumns, userInputSearchText);
    }

    public List<PerformerSearchResult> SearchPerformerBiographiesWithRelevance(string userInputSearchText)
    {
        string[] biographyColumns = { "biography" };
        return SearchWithRelevance<PerformerSearchResult>("performer_biographies", biographyColumns, userInputSearchText);
    }

    public List<PerformerSearchResult> SearchPerformerNamesWithRelevance(string userInputSearchText)
    {
        string[] performerColumns = { "first_name", "middle_name", "last_name", "honorifics", "qualifiers" };
        return SearchWithRelevance<PerformerSearchResult>("performer_names", performerColumns, userInputSearchText);
    }
}

public abstract class SearchResult
{
    public double relevance { get; set; }
}

public class TranscriptionSearchResult : SearchResult
{
    public int transcription_id { get; set; }
}

public class PerformanceSearchResult : SearchResult
{
    public PerformanceSearchResult(int performance_id, double relevance)
    {
        this.performance_id = performance_id;
        this.relevance = relevance;
    }
    public int performance_id { get; set; }
    public double relevance { get; set; }
}

public class EventSearchResult : SearchResult
{
    public int event_id { get; set; }
    public double relevance { get; set; }
}

public class PerformerSearchResult : SearchResult
{
    public int performer_id { get; set; }
    public double relevance { get; set; }
}