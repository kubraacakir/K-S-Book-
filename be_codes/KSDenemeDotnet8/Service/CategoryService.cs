using KSDenemeDotnet8.Entity;

namespace KSDenemeDotnet8.Service
{
    public interface CategoryService
    {
        public void save(Category category);
        public Category getCategory(Guid id);
        public List<Category> getAllCategory();
    }
}
