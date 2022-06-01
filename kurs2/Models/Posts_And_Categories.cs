using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace Diplom.Models
{
    public class Posts_And_Categories
    {
        [Required]
        public int id { get; set; }
        public int PostID { get; set; }
        public int CatID { get; set; }
    }
}
