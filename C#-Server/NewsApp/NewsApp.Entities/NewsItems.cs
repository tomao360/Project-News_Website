using NewsApp.Entities.Base;
using NewsApp.Model;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace NewsApp.Entities
{
    public class NewsItems: BaseEntity
    {
        public NewsItems(Logger log) : base(log) { }

        List<NewsItem> newsItemsList = null;

        public List<NewsItem> GetAllNewsItemsForUser(string userEmail)
        {
            try
            {
                newsItemsList = new List<NewsItem>();
                Data.Sql.NewsItemSql newsItemSql = new Data.Sql.NewsItemSql(base.Log);
                newsItemsList = newsItemSql.GetAllNewsItemsForUser(userEmail);
            }
            catch (Exception ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
            }

            return newsItemsList;
        }

        public void UpdateNewItemNumberTimesClicked(int itemID)
        {
            try
            {
                Data.Sql.NewsItemSql newsItemSql = new Data.Sql.NewsItemSql(base.Log);
                newsItemSql.UpdateNewItemNumberTimesClicked(itemID);
            }
            catch (Exception ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
            }
        }

        public List<NewsItem> Get10MostPopularNewsItems(string userEmail)
        {           
            try
            {
                newsItemsList = new List<NewsItem>();
                Data.Sql.NewsItemSql newsItemSql = new Data.Sql.NewsItemSql(base.Log);
                newsItemsList = newsItemSql.Get10MostPopularNewsItems(userEmail);
            }
            catch (Exception ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
            }

            return newsItemsList;
        }

        public List<NewsItem> Get10RandomNotPopularNewsItems(string userEmail)
        {
            try
            {
                newsItemsList = new List<NewsItem>();
                Data.Sql.NewsItemSql newsItemSql = new Data.Sql.NewsItemSql(base.Log);
                newsItemsList = newsItemSql.Get10RandomNotPopularNewsItems(userEmail);
            }
            catch (Exception ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
            }

            return newsItemsList;
        }
    }
}
