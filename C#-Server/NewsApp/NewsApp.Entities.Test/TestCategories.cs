using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using NewsApp.Model;
using NUnit.Framework;
using NUnit.Framework.Internal;

namespace NewsApp.Entities.Test
{
    [TestFixture, Order(2)]
    internal class TestCategories: BaseEntitiesTest
    {
        [Test, Order(1), Category("Category Test")]
        public void GetAllCategories_ShouldReturnNonEmptyList()
        {
            // Act
            categoriesList = categories.GetAllCategories();

            // Assert
            // Verify that the List is not null and contains at least one item
            Assert.IsNotNull(categoriesList, "The List is empty");
            Assert.Greater(categoriesList.Count(), 0);
        }
    }
}
