using NewsApp.Entities.NewSourcesXML;
using NewsApp.Entities.NewsSources.NewSourcesXML;
using NewsApp.Model;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace NewsApp.Entities.Test
{
    [TestFixture, Order(3)]
    internal class TestNewsItems: BaseEntitiesTest
    {
        public GlobesNewsSource globes;
        public MaarivNewsSource maariv;
        public WallaNewsSource walla;
        public YnetNewsSource ynet;

        [SetUp]
        public void Init()
        {
            globes = new GlobesNewsSource(logger);
            maariv = new MaarivNewsSource(logger);
            walla = new WallaNewsSource(logger);
            ynet = new YnetNewsSource(logger);
        }


        [Test, Order(1), Category("News Item Test")]
        public void RunGetNewsArticlesThread_ShouldSetTheLoopToRunWhenCalled()
        {
            // Act
            globes.RunGetNewsArticlesThread();
            maariv.RunGetNewsArticlesThread();
            walla.RunGetNewsArticlesThread();
            ynet.RunGetNewsArticlesThread();

            // Assert
            Assert.That(globes.StopLoop, Is.EqualTo(false));
            globes.StopLoop = true;
            Assert.That(maariv.StopLoop, Is.EqualTo(false));
            maariv.StopLoop = true;
            Assert.That(walla.StopLoop, Is.EqualTo(false));
            walla.StopLoop = true;
            Assert.That(ynet.StopLoop, Is.EqualTo(false));
            ynet.StopLoop = true;
        }

        [Test, Order(2), Category("News Item Test")]
        public void GetTheNewsSourceCategories_ValidSourceName_ShouldReturnNonEmptyList()
        {
            // Assert
            Assert.That(categoriesList.Exists(c => c.SourceName == "גלובס"), Is.EqualTo(true), "There is no categories in the list with the 'גלובס' source name.");
            Assert.That(categoriesList.Where(c => c.SourceName == "גלובס").Count(), Is.EqualTo(7), "The number of the 'גלובס' categories is not correct.");
            Assert.That(categoriesList.Exists(c => c.SourceName == "מעריב"), Is.EqualTo(true), "There is no categories in the list with the 'מעריב' source name.");
            Assert.That(categoriesList.Where(c => c.SourceName == "מעריב").Count(), Is.EqualTo(15), "The number of the 'מעריב' categories is not correct.");
            Assert.That(categoriesList.Exists(c => c.SourceName == "!וואלה"), Is.EqualTo(true), "There is no categories in the list with the '!וואלה' source name.");
            Assert.That(categoriesList.Where(c => c.SourceName == "!וואלה").Count(), Is.EqualTo(15), "The number of the '!וואלה' categories is not correct.");
            Assert.That(categoriesList.Exists(c => c.SourceName == "ynet"), Is.EqualTo(true), "There is no categories in the list with the 'ynet' source name.");
            Assert.That(categoriesList.Where(c => c.SourceName == "ynet").Count(), Is.EqualTo(14), "The number of the 'ynet' categories is not correct.");
        }

        [Test, Order(3), Category("News Item Test")]
        public void GetNewsArticleItems_ValidUrlCategoryNameSourceName_ShouldReturnNonEmptyDataTable()
        {
            // Arrange
            string globesUrl = "https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=9917";
            string categoryName = "חדשות מהארץ ומהעולם";
            string sourceName = "גלובס";
            // Assert
            Assert.DoesNotThrowAsync(async() => globes.GetNewsArticleItems(globesUrl, categoryName, sourceName), "Throw an exception while executing the function.");

            // Arrange
            string maarivUrl = "https://www.maariv.co.il/Rss/RssChadashot";
            sourceName = "מעריב";
            // Assert
            Assert.DoesNotThrowAsync(async () => globes.GetNewsArticleItems(globesUrl, categoryName, sourceName), "Throw an exception while executing the function.");

            // Arrange
            string wallaUrl = "https://rss.walla.co.il/feed/1?type=main";
            sourceName = "!וואלה";
            // Assert
            Assert.DoesNotThrowAsync(async () => globes.GetNewsArticleItems(globesUrl, categoryName, sourceName), "Throw an exception while executing the function.");

            // Arrange
            string ynetUrl = "http://www.ynet.co.il/Integration/StoryRss2.xml";
            sourceName = "ynet";
            // Assert
            Assert.DoesNotThrowAsync(async () => globes.GetNewsArticleItems(globesUrl, categoryName, sourceName), "Throw an exception while executing the function.");

            globes.StopLoop = true;
            maariv.StopLoop = true;
            walla.StopLoop = true;
            ynet.StopLoop = true;
        }

        [Test, Order(4), Category("News Item Test")]
        public void InsertNewsArticleToDB_ValidDataTable_ShouldInsertDataTableToDB()
        {
            // Arrange
            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("Title", typeof(string));
            dataTable.Columns.Add("Description", typeof(string));
            dataTable.Columns.Add("ItemLink", typeof(string));
            dataTable.Columns.Add("Image", typeof(string));
            dataTable.Columns.Add("CategoryName", typeof(string));
            dataTable.Columns.Add("SourceName", typeof(string));

            dataTable.Rows.Add("Test", "Test Description", "testLink.com", "testImage", "אוכל", "מעריב");

            // Act
            globes.InsertNewsArticleToDB(dataTable);

            // Assert
            // Verify that the data table was inserted into the database
            List<NewsItem> newsItemsList = newsItems.GetAllNewsItemsForUser(email);
            Assert.That(newsItemsList.Count(), Is.AtLeast(1));
            // Retrieve the last news item in the list
            var lastItem = newsItemsList.OrderByDescending(item => item.ItemID).FirstOrDefault();
            Assert.IsNotNull(lastItem, "The new item does not exist in the database.");
            itemID = lastItem.ItemID;

            globes.StopLoop = true;
        }

        [Test, Order(5), Category("News Item Test")]
        public void UpdateNewItemNumberTimesClicked_ValidItemID_ShouldUpdateNumberTimesClicked()
        {
            // Act
            newsItems.UpdateNewItemNumberTimesClicked((int)itemID);

            // Assert
            List<NewsItem> newsItemsList = newsItems.GetAllNewsItemsForUser(email);
            Assert.That(newsItemsList.Count(), Is.AtLeast(1));
            NewsItem item = newsItemsList.FirstOrDefault(item => item.ItemID == itemID);
            Assert.IsNotNull(item, "The item does not exist in the database.");
            Assert.That(item.NumberTimesClicked, Is.EqualTo(1));
        }

        [Ignore("Delete Not Now"), Order(5), Category("News Item Test")]
        public void DeleteUserByID_ValidInput_ShouldDeleteUserFromDB()
        {
            // Act
            newsItemSql.DeleteNewsItemByID((int)itemID);

            // Assert
            List<NewsItem> newsItemsList = newsItems.GetAllNewsItemsForUser(email);
            Assert.That(newsItemsList.Count(), Is.AtLeast(1));
            Assert.That(newsItemsList.Select(item => item.ItemID), Does.Not.Contain(itemID), $"The news item with the ID:'{(int)itemID}' was not deleted from the database.");
        }
    }
}
