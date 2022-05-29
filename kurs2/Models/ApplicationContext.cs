using Microsoft.EntityFrameworkCore;
using Diplom.Models;

namespace kurs2.Models
{
    public class ApplicationContext : DbContext
    {
        public DbSet<Users> Users { get; set; }
        public DbSet<Posts> Posts { get; set; }
        public DbSet<Comments> Comments { get; set; }
        public DbSet<Posts_Categories> Posts_Categories { get; set; }
        public DbSet<Posts_And_Categories> Posts_And_Categories { get; set; }

        public ApplicationContext(DbContextOptions<ApplicationContext> options)
            : base(options)
        {
            Database.EnsureCreated();
        }
    }
}
