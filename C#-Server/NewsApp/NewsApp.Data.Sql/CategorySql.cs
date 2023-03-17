using Microsoft.Extensions.Configuration;
using NewsApp.DAL;
using NewsApp.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace NewsApp.Data.Sql
{
    public class CategorySql: BaseDataSql
    {
        public CategorySql(Logger log) : base(log) { }

        // A function that gets all the Categories and adds them to a list 
        public List<Category> GetAllCategoriesFromDB()
        {
            // Create a new list of Categories
            List<Category> categoriesList = new List<Category>();

            // Clear the list before adding new data
            categoriesList.Clear();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("GetAllCategories", connection))
                    {
                        connection.Open();
                        // Set the command type as Stored Procedure
                        command.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Category category = new Category();

                                // Get the values for the properties of the Category object from the SQL query
                                category.CategoryID = reader.GetInt32(reader.GetOrdinal("CategoryID"));
                                category.CategoryName = reader.GetString(reader.GetOrdinal("CategoryName"));
                                category.CategoryLink = reader.GetString(reader.GetOrdinal("CategoryLink"));
                                category.SourceID = reader.GetInt32(reader.GetOrdinal("SourceID"));
                                category.SourceName = reader.GetString(reader.GetOrdinal("SourceName"));


                                // Add the Category object to the list
                                categoriesList.Add(category);
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
            }
            catch (Exception ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
            }

            return categoriesList;
        }


        // A function that gets all the Categories names and adds them to a list 
        public List<Category> GetAllCategoriesNames()
        {
            // Create a new list of Categories
            List<Category> categoriesList = new List<Category>();

            // Clear the list before adding new data
            categoriesList.Clear();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("GetAllCategoriesNames", connection))
                    {
                        connection.Open();
                        // Set the command type as Stored Procedure
                        command.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Category category = new Category();

                                // Get the values for the properties of the Category object from the SQL query
                                category.CategoryName = reader.GetString(reader.GetOrdinal("CategoryName"));
                                category.CategoryImage = reader.IsDBNull(reader.GetOrdinal("CategoryImage")) ? null : reader.GetString(reader.GetOrdinal("CategoryImage"));

                                // Add the Category object to the list
                                categoriesList.Add(category);
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
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
