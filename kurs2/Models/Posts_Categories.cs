using System;
using System.ComponentModel.DataAnnotations;

namespace Diplom.Models
{
    public class Posts_Categories
    {
        [Required]
        public int id { get; set; }
        public string Name { get; set; }
    }
}
