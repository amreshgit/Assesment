using Microsoft.AspNetCore.Mvc;

namespace WebApplication1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class BookController : ControllerBase
    {
        public BooksDAL BooksDAL;
        public BookController(IConfiguration configuration)
        {
            BooksDAL = new BooksDAL(configuration);
        }
        [Route("getallbookssortonpublisher"), HttpGet]
        public async Task<IActionResult> GetBooks()
        {
            var books = await BooksDAL.GetBooksOrderByPublisher();
            return Ok(books);
        }
        [Route("getallbookssortonauthor"), HttpGet]
        public async Task<IActionResult> GetBooksOnAuthor()
        {
            var books = await BooksDAL.GetBooksOrderByAuthor();
            return Ok(books);
        }

        [Route("gettotalprice"), HttpGet]
        public async Task<IActionResult> GetTotalPrice()
        {
            var TotalPrice = await BooksDAL.GetTotalPrice();
            return Ok(new { TotalPrice = TotalPrice });
        }
        [Route("MLAFormat"), HttpGet]
        public async Task<IActionResult> MLAFormat()
        {
            var books = await BooksDAL.GetMLAFormat();
            List<string> formats = new List<string>();
            foreach(var book in books)
            {
                string format = $"{book.AuthorFirstName} {book.AuthorLastName} {book.TitleOfTheSource} {book.TitleOfTheContainer}" +
                    $" {book.Publisher} {book.PublicationDate} {book.Location}";
                formats.Add(format);
            }
            return Ok(formats);
        }
        [Route("ChicagoFormat"), HttpGet]
        public async Task<IActionResult> ChicagoFormat()
        {
            var books = await BooksDAL.GetChicagoFormat();
            List<string> formats = new List<string>();
            foreach (var book in books)
            {
                string format = $"{book.AuthorLastName}, {book.AuthorFirstName} {book.Title}. {book.Volume}," +
                    $" {book.Issue} ({book.PublicationDate}):{book.Location}. {book.DOI}.";
                formats.Add(format);
            }
            return Ok(formats);
        }
    }
}
