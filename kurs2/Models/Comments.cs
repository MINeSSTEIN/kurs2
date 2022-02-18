using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace kurs2.Models
{
    public class Comments
    {
        [Required]
        public int id { get; set; }
        public int PostID { get; set; }
        public int AuthorID { get; set; }
        public bool Solution { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Text { get; set; }
    }
}
