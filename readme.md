# ISC StoryTelling Blazor Server
The following repository is a Blazor port of the ISC International Storytelling website.

## Database Access

The Blazor Website uses a MySQL database to store all necessary information to administer the website.

The MySQL database is accessed using Microsoft.Entity.FrameworkCore and My.Sql.EntityFrameworkCore as a plugin to Microsoft.Entity.FrameworkCore.

Microsoft Entity Framework Core code should reside in the SqlAccessLibrary component and the Blazor Server's Program.cs for configuration options.

### Microsoft.Entity.FrameworkCore

All database transactions are facilitated thought [Microsoft Entity Framework Core](https://learn.microsoft.com/en-us/ef/core/). The framework supplies a context object that represents a session with the database. The context object can retrieve entity classes from the database. Entity classes are C# objects that represent rows of tables in the database. A developer can write to instances of these entity classes use the context object to save any changes made to rows to the SQL database. Entity Framework Core generates and runs all necessary SQL queries for the developer, so developers only need to interface with the context object and retrieved entity classes.

If a developer wishes to make changes to this code, it is strongly recommended they tutorialize themselves on [Microsoft Entity Framework Core](https://learn.microsoft.com/en-us/ef/core/), including [how to properly scope connections to the database](https://learn.microsoft.com/en-us/ef/core/dbcontext-configuration/) and [DbContext factories for Blazor dependency injection](https://learn.microsoft.com/en-us/ef/core/dbcontext-configuration/#using-a-dbcontext-factory-eg-for-blazor). It is easy to generate bugs by violating the rules of DbContext lifetimes.

If it is necessary to make changes to code that uses the context object, note foreign key relationships are not loaded by default. [See documentation for details](https://learn.microsoft.com/en-us/ef/core/querying/related-data/).

### Updating Entity Classes

All entity classes are generated using MySQL.EntityFrameworkCore's Database Scaffoling. It may be necessary to modify the ISC database's schema to accommodate future changes. To learn how regenerating the entity classes in the SqlAccessLibrary -> SQL folder works, [consult the following Docu](https://dev.mysql.com/doc/connector-net/en/connector-net-entityframework-core-scaffold-example.html).

Exact step by step instructions [can be found here](./docsDev/ModifyingSQLDatabaseSchema.md), as there is some unfortunate coupling between the search algorithm and the search functionality in this project.