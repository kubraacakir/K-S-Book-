using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace KSDenemeDotnet8.Entity
{
    public class Category
    {
        [Key]
        public Guid ID { get; set; }

        public string name
        {
            get; set;
        }

        public string imagePath
        {
            get; set;
        }

    }
}
