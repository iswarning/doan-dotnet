using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace DemoApplication.Areas.Admin.ViewModels
{
    public class ProductViewModel
    {

        [Required]
        public int CategoryId { get; set; }

        [Required]
        public string Name { get; set; }

        public string Description { get; set; }

        [Required]
        public int Price { get; set; }

        [Required]
        public IFormFile Image { get; set; }

        public IFormFile MiniImage1 { get; set; }

        public IFormFile MiniImage2 { get; set; }

        [Required]
        public string Brand { get; set; }
    }
}
