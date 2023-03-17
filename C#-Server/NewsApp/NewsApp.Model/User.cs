using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsApp.Model
{
    public record User
    {
        public int UserID { get; set; }
        public string Email { get; set; }
    }
}
