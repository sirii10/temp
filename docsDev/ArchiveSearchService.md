# ArchiveSearchService

The most complex part of our SQL Library is the ArchiveSearchService class. The stakeholders require users to be able to search the archive for several different types of data (performers, performances, events, etc.) held in the MySQL server. 

In an attempt to rank data by relevance, there is a break in usage of [Microsoft Entity Framework Core](https://learn.microsoft.com/en-us/ef/core/) in order to execute some more complex SQL queries against MySQL.

This class uses the FromSqlRaw method to execute a traditional SQL query since Entity Framework Core did not seem to support fetching data with [relevance scores](https://medium.com/@havus.it/enhancing-database-search-full-text-search-fts-in-mysql-1bb548f4b9ba). The goal of the SQL query was to leverage MySQL's full text search so users could retireve data based on the content of their seaches (like the content of transcriptions) instead of just titles and full names. 

The downside is added complexity and some manual edits whenever we must [modify the SQL database Schema](./ModifyingSQLDatabaseSchema.md)

In ArchiveSearchService.cs, you will see several classes that inherit from an abstract class called SearchResult. The goal is to define a C# class that MyEntityFrameWork core understands the shape of that can return us some primary key of a table we want to search and a corresponding relevance score for how well that table's entry matched our search query. Note these classes must be added to OnModelCreating() in SqlAccessLibrary -> SQL -> ISCDatabaseContext.cs so EntityFramworkCore understands those classes for SQL queries.

```c#
   protected override void OnModelCreating(ModelBuilder modelBuilder)
   {
       modelBuilder.Entity<PerformerSearchResult>().HasNoKey().ToView(null);
       modelBuilder.Entity<PerformanceSearchResult>().HasNoKey().ToView(null);
       modelBuilder.Entity<EventSearchResult>().HasNoKey().ToView(null);
       modelBuilder.Entity<TranscriptionSearchResult>().HasNoKey().ToView(null);
```
The API of this class allows a web developer to pass an input search text into a method that will search an individual table in the MySQL database and return every entry in said table with a corresponding relevance score so the web developer can easily order search results by relevance.

The following example shows the library code to allow a web developer to Search the performances table's name column against any user input search test, returning PerformanceSearchResults, which are any rows in performances that match the search text with a relevance score represented as a double.

```c#
    public List<PerformanceSearchResult> SearchPerformanceNamesWithRelevance(string userInputSearchText)
    {
        //compare the search text against the name column of the performances table, return PerformanceSearchResults
        string[] performanceColumns = { "name" };
        return SearchWithRelevance<PerformanceSearchResult>("performances", performanceColumns, userInputSearchText);
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
```