﻿using NewsApp.Entities.NewSourcesXML;
using NewsApp.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using Utilities;

namespace NewsApp.Entities.NewsSources.NewSourcesXML
{
    public class MaarivNewsSource : BaseNewsSources, INewsSource
    {
        public MaarivNewsSource(Logger log) : base(log)
        {
            Log.LogEvent("Starting to receive information from the 'Maariv' news site");
            RunGetNewsArticlesThread();
        }

        public bool StopLoop { get; set; } = false;
        public Task GetNewsTask { get; set; }
        public object LockObject { get; set; } = new object();

        public void RunGetNewsArticlesThread()
        {
            GetNewsTask = Task.Run(() =>
            {
                while (!StopLoop)
                {
                    try
                    {
                        GetTheNewsSourceCategories();
                        Thread.Sleep(1000 * 60 * 30);
                    }
                    catch (Exception ex)
                    {
                        Log.LogException(ex.Message, ex);
                        throw;
                    }
                }
            });
        }

        public void GetTheNewsSourceCategories()
        {
            try
            {
                string newsSiteName = "מעריב";
                List<Category> categoriesForSite = categoriesList.Where(category => category.SourceName == newsSiteName).ToList();

                if (categoriesForSite.Count > 0)
                {
                    foreach (var category in categoriesForSite)
                    {
                        GetNewsArticleItems(category.CategoryLink, category.CategoryName, category.SourceName);
                    }
                }
                else
                {
                    Log.LogError("The List of 'מעריב' categories (name of the list: 'categoriesForSite') has returned empty");
                    return;
                }
            }
            catch (Exception ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
            }
        }

        public void InsertNewsArticleToDB(DataTable dataTable)
        {
            try
            {
                Data.Sql.NewsItemSql newsItemSql = new Data.Sql.NewsItemSql(Log);
                newsItemSql.InsertNewsItemToDB(dataTable);
            }
            catch (Exception ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
            }
        }


        public async Task GetNewsArticleItems(string url, string categoryName, string sourceName)
        {
            try
            {
                using (var client = new HttpClient())
                {
                    // Make a GET request to the URL 
                    var response = await client.GetAsync(url);

                    // Ensure the response was successful 
                    response.EnsureSuccessStatusCode();

                    // Read the content of the response 
                    var content = await response.Content.ReadAsStringAsync();

                    XmlDocument document = new XmlDocument();
                    document.LoadXml(content);

                    // Create a data table
                    DataTable dataTable = new DataTable();
                    dataTable.Columns.Add("Title", typeof(string));
                    dataTable.Columns.Add("Description", typeof(string));
                    dataTable.Columns.Add("ItemLink", typeof(string));
                    dataTable.Columns.Add("Image", typeof(string));
                    dataTable.Columns.Add("CategoryName", typeof(string));
                    dataTable.Columns.Add("SourceName", typeof(string));

                    int counter = 0;

                    foreach (XmlNode node in document.SelectNodes("//item"))
                    {
                        if (counter < 10)
                        {
                            string title = node["title"].InnerText;
                            string link = node["link"].InnerText;
                            string description = node["description"].InnerText;

                            string resultDescription = "";
                            string image = "";

                            if (!string.IsNullOrEmpty(description))
                            {
                                // Extraction of the description 
                                int brStartIndex = description.IndexOf("<br/>") + "<br/>".Length;
                                int brEndIndex = description.IndexOf("<br/>", brStartIndex);
                                resultDescription = description.Substring(brStartIndex, brEndIndex - brStartIndex).Trim();

                                // Extraction of the image url
                                int srcStartIndex = description.IndexOf("src='") + "src='".Length;
                                int srcEndIndex = description.IndexOf("'", srcStartIndex);
                                image = description.Substring(srcStartIndex, srcEndIndex - srcStartIndex).Trim();
                            }
                            
                            dataTable.Rows.Add(title, resultDescription, link, image, categoryName, sourceName);
                            counter++;
                        }
                        else
                        {
                            lock (LockObject)
                            {
                                Log.LogEvent($"Inserts a Data Table that contains 10 articles in the '{categoryName}' category on the '{sourceName}' website into the database");
                                InsertNewsArticleToDB(dataTable);
                            }
                            return;
                        }
                    }
                }
            }
            catch (HttpRequestException ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
            }
            catch (XmlException ex)
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
