using DemoApplication.Data;
using DemoApplication.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

namespace DemoApplication.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private readonly DemoApplicationContext _context;

        public HomeController(ILogger<HomeController> logger, DemoApplicationContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            IEnumerable<Product> data = _context.Product;
            ViewData["products"] = data;
            return View();
        }

        [Route("/Home/Detail/{id}")]
        public IActionResult Detail(int id)
        {
            int idParsed;
            // return 404 if path = "/Home/Detail/" or "/Home/Detail/kworkworkwokrowk"
            if (!int.TryParse(id.ToString(), out idParsed)) return NotFound();

            var product = _context.Product.Find(idParsed);

            if(product == null) return NotFound();
            
            ViewData["product"] = product;

            var comments = _context.Comment.OrderByDescending(o => o.Id).ToList();

            ViewData["comment"] = comments;

            _logger.LogInformation(comments.ToString());

            return View();
        }

        [HttpPost]
        public IActionResult SendComment([FromForm]string text, string productId, string userId, string userName)
        {
            int proIdParsed;
            if (!int.TryParse(productId, out proIdParsed) || text == null) return RedirectToAction("Detail", new { id = proIdParsed });

            _context.Comment.Add(new Comment()
            {
                Text = text,
                UserId = userId,
                ProductId = proIdParsed,
                UserName = userName
            });
            _context.SaveChanges();

            return RedirectToAction("Detail", new { id = proIdParsed });
        }

        [Route("/Home/Category/{id}")]
        public IActionResult GetProductByCategoryId(int id)
        {
            int idParsed;
            // return 404 if path = "/Home/Category/" or "/Home/Category/kworkworkwokrowk"
            if (!int.TryParse(id.ToString(), out idParsed)) return NotFound();

            var products = _context.Product.Where(p => p.CategoryId == idParsed).ToList();
            if (products == null) return NotFound();
            ViewData["products"] = products;
            

            return View("Index");
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
