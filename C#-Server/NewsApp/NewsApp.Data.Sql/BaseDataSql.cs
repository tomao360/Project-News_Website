using Microsoft.Extensions.Configuration;
using NewsApp.Data.Sql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace NewsApp.Data.Sql
{
    public class BaseDataSql
    {
        public BaseDataSql(Logger log)
        {
            Log = log;
        }

        public Logger Log { get; set; }
        public static object LockObject = new object();
        
        public static string GetConnectionString()
        {
            lock (LockObject)
            {
                var configuration = new ConfigurationBuilder()
                    .SetBasePath(AppContext.BaseDirectory)
                    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                    .AddJsonFile("appsettings.Test.json", optional: true, reloadOnChange: true)
                    .Build();

                 return configuration.GetSection("appSettings")["ConnectionString"];              
            }
        }

        public static string connectionString = GetConnectionString();
    }
}

