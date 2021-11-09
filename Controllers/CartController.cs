using DemoApplication.Data;
using DemoApplication.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using DemoApplication.Areas.Identity.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using DemoApplication.Models;

namespace DemoApplication.Controllers
{
    public class CartController : Controller
    {
        private readonly DemoApplicationContext _context;

        private readonly UserManager<DemoApplicationUser> _userManager;
        private readonly SignInManager<DemoApplicationUser> _signInManager;
        public CartController(DemoApplicationContext context, UserManager<DemoApplicationUser> userManager,
            SignInManager<DemoApplicationUser> signInManager)
        {
            _context = context;
            _userManager = userManager;
            _signInManager = signInManager;
        }

        [Route("/Cart/Manage")]
        [HttpGet]
        public IActionResult Index()
        {
            string sessionCart = HttpContext.Session.GetString("cart");
            if (sessionCart != null)
            {
                var currentListCartItem = JsonConvert.DeserializeObject<List<CartItemViewModel>>(sessionCart);
                ViewData["listCartItem"] = currentListCartItem;
            }
            return View("Index");
        }

        [Route("/Cart/AddToCart")]
        [HttpPost]
        public IActionResult AddToCart([FromForm]int productId, int qty)
        {
            if (qty < 1) return Json("The quantity not less than 1");

            var product = _context.Product.Find(productId);

            if(product != null)
            {
                string sessionCart = HttpContext.Session.GetString("cart");

                if (sessionCart != null)
                {
                    // Convert String getted from Session to List<CartItemViewModel>
                    var currentListCartItem = JsonConvert.DeserializeObject<List<CartItemViewModel>>(sessionCart);

                    var itemSelected = currentListCartItem.Where(i => i.ProductId == productId).FirstOrDefault();

                    if (itemSelected != null)
                    {
                        itemSelected.Quantity += qty;
                        itemSelected.TotalPrice = itemSelected.Quantity * itemSelected.UnitPrice;
                        HttpContext.Session.Remove("cart");
                        // Convert List<CartItemViewModel> to String and Set To Session
                        HttpContext.Session.SetString("cart", JsonConvert.SerializeObject(currentListCartItem));
                    }
                    else
                    {
                        var newCartItem = new CartItemViewModel()
                        {
                            ProductId = product.Id,
                            ProductName = product.Name,
                            ProductImage = product.Image,
                            Quantity = qty,
                            UnitPrice = product.Price
                        };
                        newCartItem.TotalPrice = newCartItem.UnitPrice * newCartItem.Quantity;
                        currentListCartItem.Add(newCartItem);
                        HttpContext.Session.Remove("cart");
                        // Convert List<CartItemViewModel> to String and Set To Session
                        HttpContext.Session.SetString("cart", JsonConvert.SerializeObject(currentListCartItem));
                    }
                }
                else
                {
                    var newListCart = new List<CartItemViewModel>();
                    var newCartItem = new CartItemViewModel()
                    {
                        ProductId = product.Id,
                        ProductName = product.Name,
                        ProductImage = product.Image,
                        Quantity = qty,
                        UnitPrice = product.Price
                    };
                    newCartItem.TotalPrice = newCartItem.UnitPrice * newCartItem.Quantity;
                    newListCart.Add(newCartItem);
                    // Convert List<CartItemViewModel> to String and Set To Session
                    HttpContext.Session.SetString("cart", JsonConvert.SerializeObject(newListCart));
                }
            }

            return RedirectToAction("Index");
        }


        [HttpPost]
        public IActionResult DeleteById(int productId)
        {
            string sessionCart = HttpContext.Session.GetString("cart");
            if(sessionCart != null)
            {
                var currentListCartItem = JsonConvert.DeserializeObject<List<CartItemViewModel>>(sessionCart);

                var item = new CartItemViewModel();
                if (currentListCartItem != null)
                {
                    item = currentListCartItem.Where(c => c.ProductId == productId).FirstOrDefault();
                    if (item != null)
                    {
                        currentListCartItem.Remove(item);
                        HttpContext.Session.Remove("cart");

                        string newSessionCart = JsonConvert.SerializeObject(currentListCartItem);
                        HttpContext.Session.SetString("cart", newSessionCart);
                    }
                }
            }

            return RedirectToAction("Index");
        }
    }
}
