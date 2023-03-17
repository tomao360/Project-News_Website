using NewsApp.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace NewsApp.Entities.NewsSources
{
    public class BaseNewsSources
    {
        public BaseNewsSources(Logger log)
        {
            Log = log;
        }

        public Logger Log { get; set; }

        public static List<Category> categoriesList = MainManager.Instance.categories.GetAllCategories();
    }
}
