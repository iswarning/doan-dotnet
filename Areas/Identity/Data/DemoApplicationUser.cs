using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using DemoApplication.Models;
using Microsoft.AspNetCore.Identity;

namespace DemoApplication.Areas.Identity.Data
{
    // Add profile data for application users by adding properties to the DemoApplicationUser class
    public class DemoApplicationUser : IdentityUser
    {
        [PersonalData]
        [Column(TypeName = "nvarchar(100)")]
        public string Firstname { get; set; }
        [PersonalData]
        [Column(TypeName = "nvarchar(100)")]
        public string LastName { get; set; }

        public IEnumerable<Comment> Comments { get; set; }
    }
}
