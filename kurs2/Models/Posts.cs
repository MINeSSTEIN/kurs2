using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace kurs2.Models
{
    public class Posts
    {
        [Required]
        public int id { get; set; }
        public int AuthorID { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Title { get; set; }
        public string Info { get; set; }

        public static Posts GetPost(int initID)
        {
            var cont = Controllers.HomeController.db;
            Posts post = cont.Posts.Find(initID);
            return post;
        }
    }
}
