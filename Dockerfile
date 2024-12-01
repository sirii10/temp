# Use the official .NET SDK for building the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Set the working directory
WORKDIR /src

# Copy the solution and project files
COPY StoryTellingWebsite.sln ./
COPY StoryTellingWebsite/StoryTellingWebsite.csproj StoryTellingWebsite/
COPY SqlAccessLibrary/SqlAccessLibrary.csproj SqlAccessLibrary/

# Restore dependencies
RUN dotnet restore

# Copy the rest of the source code
COPY StoryTellingWebsite/ StoryTellingWebsite/
COPY SqlAccessLibrary/ SqlAccessLibrary/

# Build the app
WORKDIR /src/StoryTellingWebsite
RUN dotnet publish -c Release -o /app/publish

# Use the ASP.NET Core runtime for running the app
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime

# Set the working directory
WORKDIR /app

# Copy the published output from the build stage
COPY --from=build /app/publish .

# Expose the port
EXPOSE 8080

# Set the entrypoint for the container
ENTRYPOINT ["dotnet", "StoryTellingWebsite.dll"]
