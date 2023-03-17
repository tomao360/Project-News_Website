using NewsApp.Entities.Base;
using NewsApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace NewsApp.Entities
{
    public class Categories: BaseEntity
    {
        public Categories(Logger log) : base(log) { }

        List<Category> categoriesList = null;

        public List<Category> GetAllCategories()
        {
            try
            {
                categoriesList = new List<Category>();
                Data.Sql.CategorySql categorySql = new Data.Sql.CategorySql(base.Log);
                categoriesList = categorySql.GetAllCategoriesFromDB();
            }
            catch (Exception ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
            }

            return categoriesList;
        }

        public List<Category> GetAllCategoriesNames()
        {
            try
            {
                categoriesList = new List<Category>();
                Data.Sql.CategorySql categorySql = new Data.Sql.CategorySql(base.Log);
                categoriesList = categorySql.GetAllCategoriesNames();
            }
            catch (Exception ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
            }

            return categoriesList;
        }
    }
}
