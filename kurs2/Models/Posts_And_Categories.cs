using Microsoft.EntityFrameworkCore;

namespace Diplom.Models
{
    [Keyless]
    public class Posts_And_Categories
    {
        public int PostID { get; set; }
        public int CatID { get; set; }
    }
}
