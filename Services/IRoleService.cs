using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DemoApplication.Services
{
    public interface IRoleService
    {
        Task<IdentityRole> GetOrCreateRole(string roleName);

        Task<bool> AddRoleToUser(string userId, string roleName);
    }
}
