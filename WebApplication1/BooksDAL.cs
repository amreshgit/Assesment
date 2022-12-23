using System.Data.SqlClient;
using Dapper;
using System.Data;
namespace WebApplication1
{
    public class BooksDAL
    {
        private readonly string _connectionString;
        private readonly IConfiguration _config;
        public BooksDAL(IConfiguration config)
        {
            _config = config;
            _connectionString = _config.GetConnectionString("DBConnectionString");
        }
        public async Task<ICollection<Book>> GetBooksOrderByPublisher()
        {
            List<Book> lstbooks=new List<Book>();
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    var procedure = "GetBooks_OrderOnPublisher";
                   var books = await connection.QueryAsync<Book> (procedure, commandType: CommandType.StoredProcedure);
                    return lstbooks = books.ToList();
                }
            }
            catch (Exception ex)
            {
            }
            return lstbooks;
        }
        public async Task<ICollection<Book>> GetBooksOrderByAuthor()
        {
            List<Book> lstbooks = new List<Book>();
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    var procedure = "GetBooks_OrderOnAuthor";
                    var books = await connection.QueryAsync<Book>(procedure, commandType: CommandType.StoredProcedure);
                    return lstbooks = books.ToList();
                }
            }
            catch (Exception ex)
            {
            }
            return lstbooks;
        }
        public async Task<decimal> GetTotalPrice()
        {
            decimal TotalPrice = 0;
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    var query = "select Sum(Price) from Book";
                    TotalPrice = await connection.ExecuteScalarAsync<int>(query);
                }
            }
            catch (Exception ex)
            {
            }
            return TotalPrice;
        }
    }
}
