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
    public class ConfigSql: BaseDataSql
    {
        public ConfigSql(Logger log) : base(log) { }


        public List<Config> GetConfigurationItems()
        {
            List<Config> configList = new List<Config>();
            configList.Clear();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("select * from Config", connection))
                    {
                        connection.Open();

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Config config = new Config();

                                config.ConfigKey = reader.GetString(reader.GetOrdinal("ConfigKey"));
                                config.ConfigValue = reader.GetString(reader.GetOrdinal("ConfigValue"));

                                // Add the NewsItem object to the list
                                configList.Add(config);
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

            return configList;
        }

    }
}
