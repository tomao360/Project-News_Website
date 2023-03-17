using Microsoft.AspNetCore.Mvc;
using NewsApp.Entities;
using System.Diagnostics;

namespace NewsApp.MicroService.Controllers
{
    [ApiController]
    [Route("api/newsitems")]
    public class NewsItemsController: ResponseController
    {
        Guid newGuid = Guid.NewGuid();

        [HttpGet("getcategories")]
        public JsonResult GetCategories()
        {
            try
            {
                MainManager.Instance.logger.LogEvent($"Start retrieving all the categories from DB ('GetCategories' function in 'NewsItemsController' class)");

                var result = MainManager.Instance.categories.GetAllCategoriesNames();
                if ( result == null )
                {
                    MainManager.Instance.logger.LogError("A problem occurred while retriving the categories names from the database");
                    return new JsonResult(base.BuildResponse("Error", "Problem Retriving Categories Names", newGuid, null));
                }
                MainManager.Instance.logger.LogEvent($"All the categories were received successfully from DB");
                return new JsonResult(base.BuildResponse("OK", "All the categories were received successfully from DB", newGuid, result));
            }
            catch (Exception ex)
            {
                MainManager.Instance.logger.LogException($"{ex.Message}. Response ID = {newGuid}", ex);
                return new JsonResult(base.BuildResponse("Error", ex.Message, newGuid, null));
            }
        }

        [HttpGet("getnewsitemsbyuser/{email}")]
        public JsonResult GetNewsItemsForUser(string? email)
        {
            try
            {
                if (email != null)
                {
                    MainManager.Instance.logger.LogEvent($"Start retrieving all the News Items for a user by User Email (Email - {email}) from DB ('GetNewsItemsForUser' function in 'NewsItemsController' class)");
                    var result = MainManager.Instance.newsItems.GetAllNewsItemsForUser(email);
                    MainManager.Instance.logger.LogEvent($"All the News Items for a user by User Email (Email - {email}) were received successfully from DB");
                    return new JsonResult(base.BuildResponse("OK", "All the News Items were received successfully from DB", newGuid, result));
                }
                else
                {
                    // Return a failure message if the required field are not present
                    MainManager.Instance.logger.LogError($"A problem occurred while getting the News Items for a user by User Email from DB in the 'GetNewsItemsForUser' function in 'NewsItemsController' class. Response ID = {newGuid}");
                    return new JsonResult(base.BuildResponse("Error", "Invalid User Email", newGuid, null));
                }
            }
            catch (Exception ex)
            {
                MainManager.Instance.logger.LogException($"{ex.Message}. Response ID = {newGuid}", ex);
                return new JsonResult(base.BuildResponse("Error", ex.Message, newGuid, null));
            }
        }


        [HttpGet("getmostpopular/{email}")]
        public JsonResult GetMostPopularNewsItems(string? email)
        {
            try
            {
                if (email != null)
                {
                    MainManager.Instance.logger.LogEvent($"Start retrieving 10 most popular News Items from the user categories from DB ('GetMostPopularNewsItems' function in 'NewsItemsController' class)");
                    var result = MainManager.Instance.newsItems.Get10MostPopularNewsItems(email);
                    MainManager.Instance.logger.LogEvent($"10 most popular News Items from the user categories were received successfully from DB");
                    return new JsonResult(base.BuildResponse("OK", "All the most popular News Items from the user categories were received successfully from DB", newGuid, result));
                }
                else
                {
                    // Return a failure message if the required field are not present
                    MainManager.Instance.logger.LogError($"A problem occurred while getting the 10 most popular News Items from the user categories from DB in 'GetMostPopularNewsItems' function in 'NewsItemsController' class. Response ID = {newGuid}");
                    return new JsonResult(base.BuildResponse("Error", "Invalid User Email", newGuid, null));
                }       
            }
            catch (Exception ex)
            {
                MainManager.Instance.logger.LogException($"{ex.Message}. Response ID = {newGuid}", ex);
                return new JsonResult(base.BuildResponse("Error", ex.Message, newGuid, null));
            }
        }


        [HttpGet("getnotpopular/{email}")]
        public JsonResult GetNotPopularNewsItems(string? email)
        {
            try
            {
                if (email != null)
                {
                    MainManager.Instance.logger.LogEvent($"Start retrieving 10 random not popular News Items from the user categories from DB ('GetNotPopularNewsItems' function in 'NewsItemsController' class)");
                    var result = MainManager.Instance.newsItems.Get10RandomNotPopularNewsItems(email);
                    MainManager.Instance.logger.LogEvent($"10 random not popular News Items from the user categories were received successfully from DB");
                    return new JsonResult(base.BuildResponse("OK", "All the not popular News Items from the user categories were received successfully from DB", newGuid, result));
                }
                else
                {
                    // Return a failure message if the required field are not present
                    MainManager.Instance.logger.LogError($"A problem occurred while getting the 10 random not popular News Items from the user categories from DB in 'GetNotPopularNewsItems' function in 'NewsItemsController' class. Response ID = {newGuid}");
                    return new JsonResult(base.BuildResponse("Error", "Invalid User Email", newGuid, null));
                }
            }
            catch (Exception ex)
            {
                MainManager.Instance.logger.LogException($"{ex.Message}. Response ID = {newGuid}", ex);
                return new JsonResult(base.BuildResponse("Error", ex.Message, newGuid, null));
            }
        }


        [HttpPost("updatenewsitem/{itemID}")]
        public JsonResult UpdateNewsItemClickedLink(int? itemID)
        {
            try
            {
                if (itemID != null)
                {
                    MainManager.Instance.logger.LogEvent($"Started updating the News Item Link (Item ID = {itemID}) in the DB ('UpdateNewsItemClickedLink' function in 'NewsItemsController' class)");
                    MainManager.Instance.newsItems.UpdateNewItemNumberTimesClicked((int)itemID);
                    MainManager.Instance.logger.LogEvent($"A News Item Link with the ID: {itemID} updated successfully in the database");
                    return new JsonResult(base.BuildResponse("OK", "News Item Link updated successfully", newGuid, null));
                }
                else
                {
                    // Return a failure message if the required field are not present
                    MainManager.Instance.logger.LogError($"A problem occurred while updating the News Item Link (Item ID = {itemID}) in the 'UpdateNewsItemClickedLink' function in 'NewsItemsController' class. Response ID = {newGuid}");
                    return new JsonResult(base.BuildResponse("Error", "Invalid Item ID", newGuid, null));
                }
            }
            catch (Exception ex)
            {
                MainManager.Instance.logger.LogException($"{ex.Message}. Response ID = {newGuid}", ex);
                return new JsonResult(base.BuildResponse("Error", ex.Message, newGuid, null));
            }
        }
    }
}
