using NewsApp.DAL;
using NewsApp.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace NewsApp.Data.Sql
{
    public class NewsItemSql: BaseDataSql
    {
        public NewsItemSql(Logger log) : base(log) { }

        // A function that gets all the News Items for user and adds them to a list 
        public List<NewsItem> GetAllNewsItemsForUser(string userEmail)
        {
            // Create a new list of News Items for user
            List<NewsItem> newsItemsList = new List<NewsItem>();

            // Clear the list before adding new data
            newsItemsList.Clear();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("GetAllNewsItemsForUser", connection))
                    {
                        connection.Open();
                        // Set the command type as Stored Procedure
                        command.CommandType = CommandType.StoredProcedure;

                        // Add parameter to the command
                        command.Parameters.AddWithValue("@userEmail", userEmail);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                NewsItem newsItem = new NewsItem();

                                // Get the values for the properties of the NewsItem object from the SQL Stored Procedure
                                newsItem.ItemID = reader.GetInt32(reader.GetOrdinal("ItemID"));
                                newsItem.Title = reader.GetString(reader.GetOrdinal("Title"));
                                newsItem.Description = reader.GetString(reader.GetOrdinal("Description"));
                                newsItem.ItemLink = reader.GetString(reader.GetOrdinal("ItemLink"));
                                newsItem.Image = reader.GetString(reader.GetOrdinal("Image"));
                                newsItem.CategoryID = reader.GetInt32(reader.GetOrdinal("CategoryID"));
                                newsItem.CategoryName = reader.GetString(reader.GetOrdinal("CategoryName"));
                                newsItem.LogoImage = reader.GetString(reader.GetOrdinal("LogoImage"));
                                newsItem.NumberTimesClicked = reader.GetInt32(reader.GetOrdinal("NumberTimesClicked"));


                                // Add the Category object to the list
                                newsItemsList.Add(newsItem);
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

            return newsItemsList;
        }


        // A function that inserts News Item to the News_Items table in SQL
        public void InsertNewsItemToDB(DataTable dataTable)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("InsertNewsItemToDB", connection))
                    {
                        connection.Open();
                        // Set the command type as Stored Procedure
                        command.CommandType = CommandType.StoredProcedure;

                        // Add parameters to the command
                        SqlParameter parameter = command.Parameters.AddWithValue("@newsItems", dataTable);

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


        // A function that updates number times clicked at the News_Items table in SQL 
        public void UpdateNewItemNumberTimesClicked(int itemID)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("UpdateNewItemNumberTimesClicked", connection))
                    {
                        connection.Open();
                        // Set the command type as Stored Procedure
                        command.CommandType = CommandType.StoredProcedure;

                        // Add parameters to the command
                        command.Parameters.AddWithValue("@itemID", itemID);

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

        public List<NewsItem> GetPopularNewsItemsForYouTube()
        {
            // Create a new list of News Items
            List<NewsItem> newsItemsList = new List<NewsItem>();

            // Clear the list before adding new data
            newsItemsList.Clear();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("GetPopularNewsItemsForYouTube", connection))
                    {
                        connection.Open();
                        // Set the command type as Stored Procedure
                        command.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                NewsItem newsItem = new NewsItem();

                                // Get the values for the properties of the NewsItem object from the SQL Stored Procedure
                                newsItem.ItemID = reader.GetInt32(reader.GetOrdinal("ItemID"));
                                newsItem.Title = reader.GetString(reader.GetOrdinal("Title"));
                                newsItem.YouTubeLink = reader.IsDBNull(reader.GetOrdinal("YouTubeLink")) ? null : reader.GetString(reader.GetOrdinal("YouTubeLink"));

                                // Add the NewsItem object to the list
                                newsItemsList.Add(newsItem);
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

            return newsItemsList;
        }

        public void UpdateYouTubeLink(int itemID, string youtubeLink)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("UpdateTouTubeLink", connection))
                    {
                        connection.Open();
                        // Set the command type as Stored Procedure
                        command.CommandType = CommandType.StoredProcedure;

                        // Add parameters to the command
                        command.Parameters.AddWithValue("@itemID", itemID);
                        command.Parameters.AddWithValue("@youtubeLink", youtubeLink);

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


        // A function that gets 10 most popular News Items from the users categories and adds them to a list 
        public List<NewsItem> Get10MostPopularNewsItems(string userEmail)
        {
            // Create a new list of News Items
            List<NewsItem> newsItemsList = new List<NewsItem>();

            // Clear the list before adding new data
            newsItemsList.Clear();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("Get10MostPopularNewsItems", connection))
                    {
                        connection.Open();
                        // Set the command type as Stored Procedure
                        command.CommandType = CommandType.StoredProcedure;

                        // Add parameter to the command
                        command.Parameters.AddWithValue("@userEmail", userEmail);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                NewsItem newsItem = new NewsItem();

                                // Get the values for the properties of the NewsItem object from the SQL Stored Procedure
                                newsItem.ItemID = reader.GetInt32(reader.GetOrdinal("ItemID"));
                                newsItem.Title = reader.GetString(reader.GetOrdinal("Title"));
                                newsItem.Description = reader.GetString(reader.GetOrdinal("Description"));
                                newsItem.ItemLink = reader.GetString(reader.GetOrdinal("ItemLink"));
                                newsItem.Image = reader.GetString(reader.GetOrdinal("Image"));
                                newsItem.CategoryID = reader.GetInt32(reader.GetOrdinal("CategoryID"));
                                newsItem.LogoImage = reader.GetString(reader.GetOrdinal("LogoImage"));
                                newsItem.NumberTimesClicked = reader.GetInt32(reader.GetOrdinal("NumberTimesClicked"));
                                newsItem.YouTubeLink = reader.GetString(reader.GetOrdinal("YouTubeLink"));

                                // Add the NewsItem object to the list
                                newsItemsList.Add(newsItem);
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

            return newsItemsList;
        }


        // A function that gets randomly 10 not popular News Items from the users categories and adds them to a list 
        public List<NewsItem> Get10RandomNotPopularNewsItems(string userEmail)
        {
            // Create a new list of News Items
            List<NewsItem> newsItemsList = new List<NewsItem>();

            // Clear the list before adding new data
            newsItemsList.Clear();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("Get10RandomNotPopularNewsItems", connection))
                    {
                        connection.Open();
                        // Set the command type as Stored Procedure
                        command.CommandType = CommandType.StoredProcedure;

                        // Add parameter to the command
                        command.Parameters.AddWithValue("@userEmail", userEmail);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                NewsItem newsItem = new NewsItem();

                                // Get the values for the properties of the NewsItem object from the SQL Stored Procedure
                                newsItem.ItemID = reader.GetInt32(reader.GetOrdinal("ItemID"));
                                newsItem.Title = reader.GetString(reader.GetOrdinal("Title"));
                                newsItem.Description = reader.GetString(reader.GetOrdinal("Description"));
                                newsItem.ItemLink = reader.GetString(reader.GetOrdinal("ItemLink"));
                                newsItem.Image = reader.GetString(reader.GetOrdinal("Image"));
                                newsItem.CategoryID = reader.GetInt32(reader.GetOrdinal("CategoryID"));
                                newsItem.LogoImage = reader.GetString(reader.GetOrdinal("LogoImage"));
                                newsItem.NumberTimesClicked = reader.GetInt32(reader.GetOrdinal("NumberTimesClicked"));


                                // Add the NewsItem object to the list
                                newsItemsList.Add(newsItem);
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

            return newsItemsList;
        }


        // A function that deletes a News Item from the Categories table in SQL
        public void DeleteNewsItemByID(int itemID)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("DeleteNewsItemByID", connection))
                    {
                        connection.Open();
                        // Set the command type as Stored Procedure
                        command.CommandType = CommandType.StoredProcedure;

                        // Add parameters to the command
                        command.Parameters.AddWithValue("@itemID", itemID);
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
