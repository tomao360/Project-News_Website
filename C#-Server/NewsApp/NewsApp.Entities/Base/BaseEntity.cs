using NewsApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace NewsApp.Entities.Base
{
    public class BaseEntity : BasePromotionSystem
    {
        public BaseEntity(Logger log) : base(log) { }
    }
}
