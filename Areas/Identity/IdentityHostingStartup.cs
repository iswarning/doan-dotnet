using System;
using DemoApplication.Areas.Identity.Data;
using DemoApplication.Data;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

[assembly: HostingStartup(typeof(DemoApplication.Areas.Identity.IdentityHostingStartup))]
namespace DemoApplication.Areas.Identity
{
    public class IdentityHostingStartup : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder)
        {
            builder.ConfigureServices((context, services) => {
                services.AddDbContext<DemoApplicationContext>(options =>
                    options.UseSqlServer(
                        context.Configuration.GetConnectionString("DemoApplicationContextConnection")));

                services.AddDefaultIdentity<DemoApplicationUser>()
                    .AddRoles<IdentityRole>()
                    .AddEntityFrameworkStores<DemoApplicationContext>();

                services.Configure<IdentityOptions>(options =>
                {
                    // Password settings
                    options.Password.RequireDigit = false;
                    options.Password.RequiredLength = 6;
                    options.Password.RequireNonAlphanumeric = false;
                    options.Password.RequireUppercase = false;
                    options.Password.RequireLowercase = false;
                    options.Password.RequiredUniqueChars = 6;

                    // Lockout settings
                    options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(30);
                    options.Lockout.MaxFailedAccessAttempts = 10;
                    options.Lockout.AllowedForNewUsers = true;

                    // User settings
                    options.User.RequireUniqueEmail = true;
                });

                //Setting the Account Login page
                services.ConfigureApplicationCookie(options =>
                {
                    // Cookie settings
                    options.Cookie.HttpOnly = true;
                    options.ExpireTimeSpan = TimeSpan.FromMinutes(30);
                    //options.LoginPath = "/Account/Login"; // If the LoginPath is not set here,
                    // ASP.NET Core will default to /Account/Login
                    //options.LogoutPath = "/Account/Logout"; // If the LogoutPath is not set here,
                    // ASP.NET Core will default to /Account/Logout
                    //options.AccessDeniedPath = "/Account/AccessDenied"; // If the AccessDeniedPath is
                    // not set here, ASP.NET Core 
                    // will default to 
                    // /Account/AccessDenied
                    options.SlidingExpiration = true;
                });

            });
        }
    }
}