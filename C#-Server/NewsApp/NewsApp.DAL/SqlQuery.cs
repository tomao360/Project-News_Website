using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsApp.DAL
{
    public class SqlQuery
    {
        public static string GetConnectionString()
        {
            var configuration = new ConfigurationBuilder()
                .SetBasePath(AppContext.BaseDirectory)
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                .AddJsonFile("appsettings.Test.json", optional: true, reloadOnChange: true)
                .Build();

            connectionString = configuration.GetSection("appSettings")["ConnectionString"];
            return connectionString;

        }

        // Connection string
        public static string connectionString = GetConnectionString();

        //Delegate
        public delegate object SetResultDataReader_delegate(SqlDataReader reader);

        //Function to get Data from SQL and returns an object
        public static object RunCommandResult(string sqlQuery, SetResultDataReader_delegate func)
        {
            object ret = null;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string queryString = sqlQuery;

                //Adapter
                using (SqlCommand command = new SqlCommand(queryString, connection))
                {
                    connection.Open();

                    //Reader
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        ret = func(reader);
                    }
                }
            }

            return ret;
        }

        //Function to get Data from SQL and returns an object using stored procedure
        public static object RunCommandResultStoredProcedure(string storedProcedure, SetResultDataReader_delegate func)
        {
            object ret = null;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                //Adapter
                using (SqlCommand command = new SqlCommand(storedProcedure, connection))
                {
                    connection.Open();
                    command.CommandType = CommandType.StoredProcedure;

                    //Reader
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        ret = func(reader);
                    }
                }
            }

            return ret;
        }
    }
}
