using KSDenemeDotnet8.Entity;

namespace KSDenemeDotnet8.Repository
{
    public class CategoryRepository
    {
        private readonly DBContext _dbContext;

        public CategoryRepository(DBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public List<Category> FindAll()
        {
            return _dbContext.Category.ToList();
        }

        public void Save(Category category)
        {

            _dbContext.Category.Add(category);

            _dbContext.SaveChanges();
        }

        public Category FindById(Guid id)
        {
            return _dbContext.Category.Find(id);
        }
    }
}
