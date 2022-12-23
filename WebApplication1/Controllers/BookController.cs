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
    }
}
