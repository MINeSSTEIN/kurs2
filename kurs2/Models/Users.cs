using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace kurs2.Models
{
    public class Users
    {
        public int id { get; set; }
        public string Name { get; set; }
        public DateTime RegDate { get; set; }
        public DateTime BirthDate { get; set; }
        public string Bio { get; set; }
        public string Photo { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public int CatID { get; set; }
    }
}
