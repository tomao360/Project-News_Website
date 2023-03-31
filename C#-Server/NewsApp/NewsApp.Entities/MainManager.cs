using Microsoft.Extensions.Configuration;
using NewsApp.Entities.NewsSources.NewSourcesXML;
using NewsApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace NewsApp.Entities
{
    public class MainManager
    {
        private MainManager()
        {
            Init();
        }

        private static readonly MainManager _instance = new MainManager();
        public static MainManager Instance { get { return _instance; } }

        public void Init()
        {
            string logTypeString = "File";
            Logger.LogType logType;

            if (logTypeString == "File")
            {
                logType = Logger.LogType.File;
            }
            else if (logTypeString == "DB")
            {
                logType = Logger.LogType.DB;
            }
            else if (logTypeString == "Console")
            {
                logType = Logger.LogType.Console;
            }
            else
            {
                logType = Logger.LogType.None;
            }
            // Creating instance of the Logger
            logger = new Logger(logType);

            // Getting configuration list
            configSql = new Data.Sql.ConfigSql(logger);
            configList = configSql.GetConfigurationItems();

            // Creating instances of all the entities
            categories = new Categories(logger);
            globes = new GlobesNewsSource(logger);
            walla = new WallaNewsSource(logger);
            maariv = new MaarivNewsSource(logger);
            ynet = new YnetNewsSource(logger);
            youtubeManager = new YouTubeManager(logger);
            users = new Users(logger);
            newsItems = new NewsItems(logger);     
        }

        public Data.Sql.ConfigSql configSql;
        public static List<Config> configList;

        public Logger logger;
        public Categories categories;
        public GlobesNewsSource globes;
        public WallaNewsSource walla;
        public MaarivNewsSource maariv;
        public YnetNewsSource ynet;
        public YouTubeManager youtubeManager;
        public Users users;
        public NewsItems newsItems;
    }
}
