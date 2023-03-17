using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsApp.Model
{
    public record UserCategory
    {
        public int UserCategoriyID { get; set; }
        public int? UserID { get; set; }
        public string? Email { get; set; }
        public string CategoryName1 { get; set; }
        public string CategoryName2 { get; set; }
        public string CategoryName3 { get; set; }
    }
}
