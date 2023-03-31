using NewsApp.Entities.Base;
using NewsApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;
using Google.Apis.YouTube.v3;
using Google.Apis.Services;
using System.Collections;
using Google;

namespace NewsApp.Entities
{
    public class YouTubeManager: BaseEntity
    {
        public YouTubeManager(Logger log) : base(log)
        {
            Log.LogEvent("Starting to receive information from the YouTube API");
            RunGetYouTubeLinksThread();
        }

        public bool StopLoop { get; set; } = false;
        public Task GetYouTubeLinkTask { get; set; }

        public void RunGetYouTubeLinksThread()
        {
            GetYouTubeLinkTask = Task.Run(() =>
            {
                while (!StopLoop)
                {
                    try
                    {
                        GetYouTubeLink();
                        Thread.Sleep(1000 * 60 * 60);
                    }
                    catch (Exception ex)
                    {
                        Log.LogException(ex.Message, ex);
                        throw;
                    }
                }
            });
        }

        public List<NewsItem> GetPopularNewsItems()
        {
            List<NewsItem> newsItemsList;
            try
            {
                Log.LogEvent("Recieve the most popular news items list");
                newsItemsList = new List<NewsItem>();
                Data.Sql.NewsItemSql newsItemSql = new Data.Sql.NewsItemSql(base.Log);
                newsItemsList = newsItemSql.GetPopularNewsItemsForYouTube();
            }
            catch (Exception ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
            }

            return newsItemsList;
        }

        public YouTubeService ConnectToYouTubeAPI()
        {
            try
            {
                Log.LogEvent("Connect to the YouTube API");
                var youtubeService = new YouTubeService(new BaseClientService.Initializer()
                {
                    ApiKey = MainManager.configList.FirstOrDefault(config => config.ConfigKey == "YouTubeApiKey")?.ConfigValue,
                    ApplicationName = MainManager.configList.FirstOrDefault(config => config.ConfigKey == "YouTubeApplicationName")?.ConfigValue
                });

                return youtubeService;
            }
            catch (GoogleApiException ex)
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

        public void GetYouTubeLink()
        {
            try
            {
                YouTubeService youtubeService = ConnectToYouTubeAPI();
                List<NewsItem> newsItemsList = GetPopularNewsItems();

                foreach (NewsItem item in newsItemsList)
                {
                    if (item.YouTubeLink == null || item.YouTubeLink == "")
                    {
                        Log.LogEvent($"Search YouTube by using the API. The Search is by the news item Title - '{item.Title}'");
                        var searchListRequest = youtubeService.Search.List("snippet");
                        searchListRequest.Q = item.Title;
                        searchListRequest.MaxResults = 1;
                        var searchListResponse = searchListRequest.Execute();

                        if (searchListResponse.Items.Count > 0)
                        {
                            string videoId = searchListResponse.Items[0].Id.VideoId;

                            // Update the news item with the YouTube link
                            Data.Sql.NewsItemSql newsItemSql = new Data.Sql.NewsItemSql(base.Log);
                            Log.LogEvent($"Update the YouTube videoId in the News_Items Table in SQL. The Link:{videoId}");
                            newsItemSql.UpdateYouTubeLink(item.ItemID, (videoId));
                        }
                        else
                        {
                            Log.LogError("There is no results for this title");
                        }
                    }
                }
            }
            catch (GoogleApiException ex)
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
