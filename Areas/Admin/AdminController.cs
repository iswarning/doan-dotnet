using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DemoApplication.Controllers
{
    [Authorize(Roles = "admin")]
    [Area("Admin")]
    public abstract class AdminController : Controller
    {
    }
}
