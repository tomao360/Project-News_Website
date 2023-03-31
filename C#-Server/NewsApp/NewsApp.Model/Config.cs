using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsApp.Model
{
    public record Config
    {
        public string ConfigKey { get; set; }
        public string ConfigValue { get; set; }
    }
}
