using KSDenemeDotnet8.Entity;
using KSDenemeDotnet8.Repository;

namespace KSDenemeDotnet8.Service.impl
{
    public class CategoryServiceImpl
    {
        private readonly CategoryRepository rep
            ;

        public CategoryServiceImpl(CategoryRepository _rep)
        {
            rep = _rep;
        }
        public List<Category> getAllCategory()
        {
            return rep.FindAll();
        }

        public Category getCategory(Guid id)
        {
            return rep.FindById(id);
        }

        public void save(Category category)
        {
             rep.Save(category);
        }
    }
}
