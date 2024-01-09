using KSDenemeDotnet8.Entity;
using KSDenemeDotnet8.Service;
using KSDenemeDotnet8.Service.impl;
using Microsoft.AspNetCore.Mvc;

namespace KSDenemeDotnet8.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookController
    {
        private readonly BookServiceImpl bookService;

        public BookController(BookServiceImpl _bookService)
        {
            bookService = _bookService;
        }

        [HttpGet("{id}")]
        public
          Book getBook(Guid id)
        {
            return (bookService.getBook(id));
        }

        [HttpPost]
        public void save(Book book)
        {
            bookService.save(book);

        }

        [HttpGet("getAll")]
        public List<Book> getAll()
        {

            return (bookService.getAll());
        }
    }
}
