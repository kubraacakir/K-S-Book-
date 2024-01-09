using KSDenemeDotnet8.Entity;
using KSDenemeDotnet8.Repository;

namespace KSDenemeDotnet8.Service.impl
{
    public class BookServiceImpl : BookService
    {

        private readonly BookRepository rep;

        public BookServiceImpl(BookRepository _rep)
        {
            rep = _rep;
        }
        public List<Book> getAll()
        {
            return rep.FindAll();   
        }

        public Book getBook(Guid id)
        {
            return rep.FindById(id);
        }

        public void save(Book book)
        {
           rep.Save(book);
        }
    }
}
