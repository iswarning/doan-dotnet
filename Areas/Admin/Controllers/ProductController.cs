using DemoApplication.Controllers;
using DemoApplication.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DemoApplication.Models;
using AutoMapper;
using DemoApplication.Areas.Admin.ViewModels;
using System.IO;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;

namespace DemoApplication.Areas.Admin.Products.Controllers
{
    public class ProductController : AdminController
    {
        private readonly DemoApplicationContext _context;

        private readonly IWebHostEnvironment webHostEnvironment;

        public ProductController(DemoApplicationContext context, IWebHostEnvironment webHostEnvironment)
        {
            _context = context;
            this.webHostEnvironment = webHostEnvironment;
        }

        public IActionResult Index()
        {
            var products = _context.Product.ToList();
            products.ForEach(c =>
            {
                c.Category = _context.Category.Find(c.CategoryId);
                if(string.IsNullOrEmpty(c.Brand))
                {
                    c.Brand = "-";
                }
            });
            ViewBag.ListProduct = products;
            return View();
        }

        public IActionResult Create()
        {
            var model = new ProductViewModel();
            return View(model);
        }

        [HttpPost]
        public IActionResult Create(ProductViewModel model)
        {
            if(ModelState.IsValid)
            {
                string pathImage = UploadedFile(model.Image);

                string pathMiniImage1 = UploadedFile(model.MiniImage1);

                string pathMiniImage2 = UploadedFile(model.MiniImage2);

                _context.Product.Add(new Product()
                {
                    CategoryId = model.CategoryId,
                    Name = model.Name,
                    Description = model.Description,
                    Price = model.Price,
                    Image = pathImage,
                    MiniImage1 = pathMiniImage1,
                    MiniImage2 = pathMiniImage2,
                    Brand = model.Brand,
                });
                _context.SaveChanges();

                return RedirectToAction("Index");
            }

            return View(model);
        }

        private string UploadedFile(IFormFile file)
        {
            string uniqueFileName = null;

            if(file != null)
            {
                string uploadsFolder = Path.Combine(webHostEnvironment.WebRootPath, "image");
                uniqueFileName = Guid.NewGuid().ToString() + "_" + file.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    file.CopyTo(fileStream);
                }
            }
            return "image/" + uniqueFileName;
        }
    }
}
