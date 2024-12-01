# SqlAccessLibrary

The SQLAcccessLibrary contains all the code that interacts with the storytelling website's MySQL server. It operates using [Microsoft Entity Framework Core](https://learn.microsoft.com/en-us/ef/core/) and a plugin (Pomelo.EntityFrameworkCore.MySql) to make Entity Framework Core work with MySQL servers.

All SQL operations take place using the IscDatabaseContext object. This object has a DbSet for every table in the MySQLDatabase. Each DbSet is of a C# datatype that represents a single entry in the MySqlDatabase. 

A developer can access each property of the IscDatabaseContext, adding, updating, deleting, or simply reading rows of the MySQL database. Here are a couple basic examples:

```C#

public async Task<Performance?> GetPerformance(int performanceId)
{
     //Create a dbContext. We are using a dependency injected factory to create a scoped dbContext for every SQL transaction so we don't spawn an excessive amount of connections to the mySQL server all at once
    using var dbContext = _applicationDbContextFactory.CreateDbContext();
    //Get a list of every Performer on the MySQL Server
    return await dbContext.Performances
        .Include(p => p.EventPerformances)
        .Include(p => p.PerformanceKeywords)
        .Include(p => p.PerformancePerformers)
        .Include(p => p.PerformanceRecordings)
        .FirstOrDefaultAsync(p => p.PerformanceId == performanceId);
    //Note the Include Statements are so foreign key relationships are loaded in each Performance C# object. By default, they are not loaded, since this can be expensive.
}

public async Task<bool> UpdatePerformer(Performer performer)
{
    //Again, scope the dbContext to this method only to prevent leaving tons of connections open to the MySQL server
    using var dbContext = _applicationDbContextFactory.CreateDbContext();
    try
    {
        //Pass in a Performer object (based on one that already exists on the server)
        dbContext.Performers.Update(performer);
        //Tell the dbContext to overwite the Performer row by explicitly calling SaveChangesAsync. Without this, Update will do nothing. Allows for bulk transactions
        await dbContext.SaveChangesAsync(true);
    }
    catch (Exception)
    {
        //TODO: improve handling
        return false;
    }
    return true;
}

```

The goal of this format is to allow developers in the StoryTellingWebiste to dependency inject a class like PerformanceService into their webpage and deal with C# classes without any concern about properly scoping their IscDatabaseContext objects or calling SaveChanges/SaveChangesAsync at the right time. As far as a web developer is concerned, they just need to ask for C# classes containing server data and leave all the SQL details up to the SqlAccesssLibrary.

Note in the example the try catches have no error handling. This is a tech debt, and should be addressed, since all editing actions in the server do not have error handling yet.