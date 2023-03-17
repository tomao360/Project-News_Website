using NewsApp.Model;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsApp.Entities.Test
{
    internal class TestDelete: BaseEntitiesTest
    {
        [Test, Order(4)]
        public void Cleanup()
        {
            newsItemSql.DeleteNewsItemByID((int)itemID);
            List<NewsItem> newsItemsList = newsItems.GetAllNewsItemsForUser(email);
            Assert.That(newsItemsList.Select(item => item.ItemID), Does.Not.Contain(itemID), $"The news item with the ID:'{(int)itemID}' was not deleted from the database.");

            userSql.DeleteUserByID((int)userID);
            Dictionary<int, User> usersDic = (Dictionary<int, User>)userSql.LoadUsers();
            Assert.IsFalse(usersDic.ContainsKey((int)userID), $"The user with the ID:'{userID}' was not deleted from the database.");
        }
    }
}
