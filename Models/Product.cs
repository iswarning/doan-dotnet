using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace DemoApplication.Models
{
    public class Product
    {
        public int Id { get; set; }

        [Required]
        public int CategoryId { get; set; }

        [Required]
        public string Name { get; set; }

        public string Description { get; set; }

        [Required]
        public int Price { get; set; }

        [Required]
        public string Image { get; set; }

        public string MiniImage1 { get; set; }

        public string MiniImage2 { get; set; }

        [Required]
        public string Brand { get; set; }

        public Category Category { get; set; }

        public IEnumerable<Comment> Comments { get; set; }
    }
}
