using DemoApplication.Areas.Identity.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace DemoApplication.Middleware
{
    public class CheckAccessAdminMiddleware
    {
        // Lưu middlewware tiếp theo trong Pipeline
        private readonly RequestDelegate _next;
        public CheckAccessAdminMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext context)
        {
            var currentPath = context.Request.Path;
            if (currentPath.HasValue && currentPath.Value.StartsWith("/admin"))
            {
                if (!context.User.Identity.IsAuthenticated)
                {
                    context.Response.Redirect("/Identity/Account/Login");
                }

                if (context.User.IsInRole("admin"))
                {
                    Console.WriteLine("CheckAccessAdminMiddleware: You have not permission to access this resource");
                    await Task.Run(async () =>
                    {
                        string html = "<h1>You have not permission to access this resource</h1>";
                        context.Response.StatusCode = StatusCodes.Status403Forbidden;
                        await context.Response.WriteAsync(html);
                    });
                } else { await _next(context); }

                
            }

            await _next(context);
        }
    }
}
