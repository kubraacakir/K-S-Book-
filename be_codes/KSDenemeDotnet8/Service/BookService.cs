using KSDenemeDotnet8.Entity;

namespace KSDenemeDotnet8.Service
{
    public interface BookService
    {
        public void save(Book book);
        public Book getBook(Guid id);
        public List<Book> getAll();
    }
}
