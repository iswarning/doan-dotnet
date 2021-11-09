using DemoApplication.Areas.Identity.Data;
using DemoApplication.Data;
using DemoApplication.Models;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DemoApplication.Services
{
    public class RoleService : IRoleService
    {
        private readonly RoleManager<IdentityRole> _roleManager;

        private readonly UserManager<DemoApplicationUser> _userManager;

        private readonly DemoApplicationContext _context;

        public RoleService(RoleManager<IdentityRole> roleManager, UserManager<DemoApplicationUser> userManager, DemoApplicationContext context)
        {
            _roleManager = roleManager;
            _userManager = userManager;
            _context = context;
        }

        public async Task<bool> AddRoleToUser(string userId, string roleName)
        {
            var user = await _userManager.FindByIdAsync(userId);

            var role = await GetOrCreateRole(roleName);

            if (user == null || role == null) return false;

            await _context.UserRoles.AddAsync(new IdentityUserRole<string>()
            {
                UserId = user.Id,
                RoleId = role.Id
            });

            await _context.SaveChangesAsync();

            return true;
        }

        public async Task<IdentityRole> GetOrCreateRole(string roleName)
        {
            var roleExist = await _roleManager.RoleExistsAsync(roleName.ToLower());
            if (!roleExist)
            {
                var createRole = await _roleManager.CreateAsync(new IdentityRole(roleName));
                if (createRole.Succeeded)
                {
                    return await _roleManager.FindByNameAsync(roleName);
                }
            }
            else
            {
                return await _roleManager.FindByNameAsync(roleName);
            }

            return null;
        }
    }
}
