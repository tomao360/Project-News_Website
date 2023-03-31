using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsApp.Model
{
    public record Category
    {
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }
        public string CategoryLink { get; set; }
        public int SourceID { get; set; }
        public string SourceName { get; set; }
        public byte[]? CategoryImage { get; set; }
    }
}
