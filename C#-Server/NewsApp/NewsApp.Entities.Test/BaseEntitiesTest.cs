using Microsoft.Extensions.Configuration;
using NewsApp.DAL;
using NewsApp.Data.Sql;
using NewsApp.Entities.NewsSources.NewSourcesXML;
using NewsApp.Model;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace NewsApp.Entities.Test
{
    [TestFixture]
    internal class BaseEntitiesTest
    {
        public static Logger logger = new Logger(Logger.LogType.DB);
        public string email;
        public static List<Category> categoriesList = null;
        public static int? userID = null;
        public static int? itemID = null;

        public Categories categories;
        public Users users;
        public UserSql userSql;
        public UserCategorySql userCategorySql;
        public NewsItems newsItems;
        public NewsItemSql newsItemSql;

        [OneTimeSetUp]
        public void Init()
        {
            email = "test@test.com";

            // Initializa the entities
            categories = new Categories(logger);
            users = new Users(logger);
            userSql = new UserSql(logger);
            userCategorySql = new UserCategorySql(logger);
            newsItems = new NewsItems(logger);
            newsItemSql = new NewsItemSql(logger);
        }
    }
}
