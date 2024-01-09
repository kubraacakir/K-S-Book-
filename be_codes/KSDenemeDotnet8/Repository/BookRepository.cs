using KSDenemeDotnet8.Entity;

namespace KSDenemeDotnet8.Repository
{
    public class BookRepository
    {
        private readonly DBContext _dbContext;

        public BookRepository(DBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public List<Book> FindAll()
        {
            return _dbContext.Books.ToList();
        }

        public void Save(Book book)
        {

            _dbContext.Books.Add(book);

            _dbContext.SaveChanges();
        }

        public Book FindById(Guid id) {
            return _dbContext.Books.Find(id);
        }
    }
}
