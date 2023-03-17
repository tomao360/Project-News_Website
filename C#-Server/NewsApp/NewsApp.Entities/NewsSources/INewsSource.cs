using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsApp.Entities.NewSourcesXML
{
    public interface INewsSource
    {
        public bool StopLoop { get; set; }

        public object LockObject { get; set; }

        public Task GetNewsTask { get; set; }

        public void RunGetNewsArticlesThread();

        public void GetTheNewsSourceCategories();

        public void InsertNewsArticleToDB(DataTable dataTable);

        public Task GetNewsArticleItems(string url, string categoryName, string sourceName);
    }
}
