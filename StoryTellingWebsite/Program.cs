using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Components.Server.ProtectedBrowserStorage;
using SqlAccessLibrary;
using SqlAccessLibrary.SQL;
using Microsoft.EntityFrameworkCore;
using StoryTellingWebsite.Data;
using MudBlazor.Services;
using SqlAccessLibrary.DataEntry;


var builder = WebApplication.CreateBuilder(args);

builder.WebHost.UseStaticWebAssets();

// Add services to the container.
builder.Services.AddRazorPages();

builder.Services.AddServerSideBlazor();
builder.Services.AddSingleton<WeatherForecastService>();

builder.Services.AddDbContextFactory<IscDatabaseContext>(options => options.UseMySql(builder.Configuration.GetConnectionString("isc"), ServerVersion.AutoDetect(builder.Configuration.GetConnectionString("isc"))));

builder.Services.AddScoped<UserService>();
builder.Services.AddScoped<EventService>();
builder.Services.AddScoped<PageService>();
builder.Services.AddScoped<PerformanceService>();
builder.Services.AddScoped<SearchService>();
builder.Services.AddScoped<TitlePageService>();
builder.Services.AddScoped<AboutPageService>();
builder.Services.AddScoped<ArchiveSearchService>();
builder.Services.AddScoped<ExcelImportService>();
builder.Services.AddScoped<UploadStatusService>();
builder.Services.AddMudServices();
builder.Services.AddAuthenticationCore();
builder.Services.AddScoped<ProtectedLocalStorage >();

builder.Services.AddScoped<AuthenticationStateProvider, CustomAuthenticationStateProvider>();
builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("AdminOnly",policy =>policy.RequireRole("admin"));
});


var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();
