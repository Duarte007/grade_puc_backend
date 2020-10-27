using Microsoft.EntityFrameworkCore;

namespace backend.database
{
    public class ApplicationDBContext : DbContext
    {

        public ApplicationDBContext(DbContextOptions<ApplicationDBContext> options): base(options){

        } 
        
    }
}