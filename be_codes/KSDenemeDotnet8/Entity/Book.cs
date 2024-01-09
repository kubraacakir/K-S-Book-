using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace KSDenemeDotnet8.Entity
{
    public class Book
    {

        [Key]
        public Guid ID { get; set; }

        public string name { get; set; }

        public decimal price { get; set; }

        public string imagePath { get; set; }

        public string yazar { get; set; }

        public decimal sayfaSayısı { get; set; }
    }
}
