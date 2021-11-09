using Microsoft.AspNetCore.Builder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DemoApplication.Middleware
{
    public static class MyAppExtensions
    {
        // Mở rộng cho IApplicationBuilder phương thức UseCheckAccess
        public static IApplicationBuilder UseCheckAccessAdmin(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<CheckAccessAdminMiddleware>();
        }
    }
}
