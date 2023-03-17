using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;
using NewsApp.DAL;
using NewsApp.Model;

namespace NewsApp.Data.Sql
{
    public class UserCategorySql: BaseDataSql
    {
        public UserCategorySql(Logger log) : base(log) { }

        // A delegate function that adds the User Categories to dictionary 
        public Dictionary<int, UserCategory> AddUserCategoriesToDictionary(SqlDataReader reader)
        {
            // Create a new dictionary of User Categories
            Dictionary<int, UserCategory> userCategoriesDic = new Dictionary<int, UserCategory>();

            // Clear the dictionary before adding new data
            userCategoriesDic.Clear();

            while (reader.Read())
            {
                UserCategory userCategory = new UserCategory();

                // Get the values for the properties of the UserCategory object from the SQL query
                userCategory.UserCategoriyID = reader.GetInt32(reader.GetOrdinal("UserCategoriyID"));
                userCategory.UserID = reader.IsDBNull(reader.GetOrdinal("UserID")) ? null : reader.GetInt32(reader.GetOrdinal("UserID"));
                userCategory.CategoryName1 = reader.GetString(reader.GetOrdinal("CategoryName1"));
                userCategory.CategoryName2 = reader.GetString(reader.GetOrdinal("CategoryName2"));
                userCategory.CategoryName3 = reader.GetString(reader.GetOrdinal("CategoryName3"));

                // Add the User object to the dictionary
                userCategoriesDic.Add(userCategory.UserCategoriyID, userCategory);
            }

            return userCategoriesDic;
        }

        public object LoadUsersCategories()
        {
            object retDictionary = null;

            try
            {
                // SQL query to select all columns from the Users_Categories table
                string sqlQuery = "select * from Users_Categories";
                retDictionary = SqlQuery.RunCommandResult(sqlQuery, AddUserCategoriesToDictionary);
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

            return retDictionary;
        }


        // A function that inserts User Categories to the Users_Categories table in SQL
        public void InsertOrUpdateUserCategoriesInDB(string userEmail, string categoryName1, string categoryName2, string categoryName3)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("InsertOrUpdateUserCategoriesInDB", connection))
                    {
                        connection.Open();
                        // Set the command type as Stored Procedure
                        command.CommandType = CommandType.StoredProcedure;

                        // Add parameters to the command
                        command.Parameters.AddWithValue("@userEmail", userEmail);
                        command.Parameters.AddWithValue("@categoryName1", categoryName1);
                        command.Parameters.AddWithValue("@categoryName2", categoryName2);
                        command.Parameters.AddWithValue("@categoryName3", categoryName3);

                        //Execute the command
                        command.ExecuteNonQuery();
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
        }
    }
}
