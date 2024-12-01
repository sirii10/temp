# Modifying SQL Database Schema

The C# Classes under SqlAccessLibrary -> SQL folder must be kept in sync with the current mySQL database schema. 

Each class matches a table in the SQL database. The class's properties correspond to the table's columns. In order for the website to function properly, these classes must line up with the SQL database.

There will be times where it is necessary to add/remove rows and update table relationships in the mySQL server. After the updates are made to the mySQL server, the storytelling website project must get corresponding updates. Rather than manually editing the classes (which will be error prone and time consuming) you can use Scaffold-DbContext to auto generate the new proper c# classes and IscDatabaseContext.cs file.

The Database Scaffolding script will also create a context object for Entity Framework Core which implements the class DbContext. This class, named \<databaseName\>Context.cs provides access to the database for CRUD operations. Performing this script will overwrite existing files and may break other classes that make use of \<databaseName\>Context.cs if the changes to the database schema are severe enough. Note the class is currently named IscDatabaseContext.cs

The following script must be executed against the Package Manager Console with the default project set to SqlAccessLibrary in Visual Studio (Use a working connection string to an active MySQL Database with an updated schema). Ensure you set your startup project to SqlAccessLibrary (right clock SqlAccessLibrary in visual studio -> Set as Startup Project). If there are compile errors in StoryTellingWebsite or SqlAccessLibrary, the script will fail.

```
PM> Scaffold-DbContext "Server=<MySQLServerIp>;Port=<MySQLServerPort>;database=<databaseName>;user id=<UserID>;password=<dbPassword>" MySql.EntityFrameworkCore -OutputDir SQL -f
```
Scaffold-DbContext will automatically generate entity classes for every table in the database and edit IscDatabaseContext.cs. Entity classes include foreign key links.

**Please note this scipt is NOT sufficient to regenerate the code properly. There are certain manual edits that MUST be added back into the generated code in order to avoid breaking the search functionality.**

Here are the following edits that must be done manually after running the above script:

1. In IscDatabaseContext.cs in OnModelCreating, add these four lines ->  
```c#
   protected override void OnModelCreating(ModelBuilder modelBuilder)
   {
       modelBuilder.Entity<PerformerSearchResult>().HasNoKey().ToView(null);
       modelBuilder.Entity<PerformanceSearchResult>().HasNoKey().ToView(null);
       modelBuilder.Entity<EventSearchResult>().HasNoKey().ToView(null);
       modelBuilder.Entity<TranscriptionSearchResult>().HasNoKey().ToView(null);
```
2. Modify Event.cs, Performance.cs, and Performer.cs to implement the ISearchable Interface
```c#
public partial class Event: ISearchable
public partial class Performance: ISearchable
public partial class Performer: ISearchable
```
The SearchResult classes must be added in OnModelCreating so IscDtabaseContext understands how to pull data in this shape from the SQL sever to support search functionality using relevance scores.


3. In IscDatabaseContext.cs delete OnConfiguring to prevent issues with server configuration. Server IP address should be managed in StoryTellingWebsite -> appsettings.json.
```c#
    //Delete this method
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseMySQL("Server=127.0.0.1;Port=3306;database=isc_database;user id=root;password=<>"); 

```

The first two manual edits are a consequence of an unfortuante coupling between the search algorithm and auto generated code. Ideally, the search algorithm can be changed such that these tightly coupled edits will no longer be necessary after running this script.