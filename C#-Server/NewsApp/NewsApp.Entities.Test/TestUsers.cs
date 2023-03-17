using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using NewsApp.Model;
using NUnit.Framework;

namespace NewsApp.Entities.Test
{
    [TestFixture, Order(1)]
    internal class TestUsers: BaseEntitiesTest
    {
        [Test, Order(1), Category("User Test")]
        public void InsertUserToDB_ValidEmail_ShouldInsertUserToDB()
        {
            // Act
            users.InsertUserToDB(email);

            // Assert
            // Verify that the user was inserted correctly in the database
            Dictionary<int, User> usersDic = (Dictionary<int, User>)users.GetAllUsersFromDB();
            Assert.That(usersDic.Count(), Is.AtLeast(1));
            Assert.That(usersDic.Values.Any(u => u.Email == email), $"The user with the email:'{email}' was not inserted into the database.");
        }

        [Test, Order(2), Category("User Test")]
        public void InsertOrUpdateUserCategories_ValidInputs_ShouldInsertUserCategoriesToDB()
        {
            // Arrange
            string categoryName1 = "אוכל";
            string categoryName2 = "ספורט";
            string categoryName3 = "תרבות";

            // Act 
            users.InsertOrUpdateUserCategories(email, categoryName1, categoryName2, categoryName3);

            // Assert
            // Verify that the user categories were inserted correctly in the database
            Dictionary<int, User> usersDic = (Dictionary<int, User>)users.GetAllUsersFromDB();
            Assert.IsNotNull(usersDic, "The Dictionary is empty");
            userID = usersDic.OrderByDescending(u => u.Value.UserID).FirstOrDefault().Key;
            Assert.IsNotNull(userID, $"The user with the email:{email} does not exist in the database.");

            Dictionary<int, UserCategory> userCategoriesDic = (Dictionary<int, UserCategory>)userCategorySql.LoadUsersCategories();
            Assert.That(userCategoriesDic.Count(), Is.AtLeast(1));
            Assert.That(userCategoriesDic.Values.Any(a => a.UserID == userID &&
                                                      a.CategoryName1 == categoryName1 &&
                                                      a.CategoryName2 == categoryName2 &&
                                                      a.CategoryName3 == categoryName3), $"The user with the categories: '{categoryName1}', '{categoryName2}', '{categoryName1}', and email:'{email}' was not inserted into the database.");
        }

        [Ignore("Delete Not Now"), Order(3), Category("User Test")]
        public void DeleteUserByID_ValidInput_ShouldDeleteUserFromDB()
        {
            // Act
            userSql.DeleteUserByID((int)userID);

            // Assert
            Dictionary<int, User> usersDic = (Dictionary<int, User>)users.GetAllUsersFromDB();
            Assert.IsFalse(usersDic.ContainsKey((int)userID), $"The user with the ID:'{userID}' was not deleted from the database.");
        }
    }
}
