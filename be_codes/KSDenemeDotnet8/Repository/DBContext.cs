using KSDenemeDotnet8.Entity;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace KSDenemeDotnet8.Repository
{
    public class DBContext : DbContext
    {
        public DbSet<Book> Books { get; set; }
        public DbSet<Category> Category{ get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=dotnet;Username=postgres;Password=5506;Pooling=true;");

        }
    }
}
