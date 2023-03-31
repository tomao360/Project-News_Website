using Microsoft.AspNetCore.Mvc;
using NewsApp.Entities;
using NewsApp.Model;

namespace NewsApp.MicroService.Controllers
{
    [ApiController]
    [Route("api/users")]
    public class UsersController: ResponseController
    {
        Guid newGuid = Guid.NewGuid();

        [HttpGet("getusers")]
        public JsonResult GetUsers()
        {
            try
            {
                MainManager.Instance.logger.LogEvent("Start retrieving all the Users from DB ('GetUsers' function in 'UsersController' class)");

                var result = MainManager.Instance.users.GetAllUsersFromDB();
                if (result == null)
                {
                    MainManager.Instance.logger.LogError("A problem occurred while retriving the users from the database");
                    return new JsonResult(base.BuildResponse("Error", "Problem Retriving Users", newGuid, null));
                }

                MainManager.Instance.logger.LogEvent("All the Users were received successfully from DB");
                return new JsonResult(base.BuildResponse("OK", "All the Users were received successfully from DB", newGuid, result));
            }
            catch (Exception ex)
            {
                MainManager.Instance.logger.LogException($"{ex.Message}. Response ID = {newGuid}", ex);
                return new JsonResult(base.BuildResponse("Error", ex.Message, newGuid, null));
            }
        }

        [HttpPost("insertuser/{email}")]
        public JsonResult InsertUserToDb(string? email)
        {
            try
            {
                if (email != null)
                {
                    MainManager.Instance.logger.LogEvent($"Started inserting a User with the email: {email} into the DB ('InsertUserToDb' function in 'UsersController' class)");
                    MainManager.Instance.users.InsertUserToDB(email);
                    MainManager.Instance.logger.LogEvent($"A User with the email: {email} was inserted successfully into the database");
                    return new JsonResult(base.BuildResponse("OK", "User inserted successfully", newGuid, null));
                }
                else
                {
                    // Return a failure message if the required field are not present
                    MainManager.Instance.logger.LogError($"A problem occurred while inserting a user into the DB in the 'InsertUserToDb' function in 'UsersController' class. Response ID = {newGuid}");
                    return new JsonResult(base.BuildResponse("Error", "Invalid User Email", newGuid, null));
                }
            }
            catch (Exception ex)
            {
                MainManager.Instance.logger.LogException($"{ex.Message}. Response ID = {newGuid}", ex);
                return new JsonResult(base.BuildResponse("Error", ex.Message, newGuid, null));
            }
        }


        [HttpPost("insertusercategories")]
        public JsonResult InsertUserCategoriesToDb(UserCategory userCategory)
        {
            try
            {
                MainManager.Instance.logger.LogEvent($"Started inserting a User categories for a user with the email: {userCategory.Email} into the DB ('InsertUserCategoriesToDb' function in 'UsersController' class)");
                MainManager.Instance.users.InsertOrUpdateUserCategories(userCategory.Email, userCategory.CategoryName1, userCategory.CategoryName2, userCategory.CategoryName3);
                MainManager.Instance.logger.LogEvent($"The User Categories for the user with the email: {userCategory.Email} were inserted successfully into the database");
                return new JsonResult(base.BuildResponse("OK", "User Categories inserted successfully", newGuid, null));
            }
            catch (Exception ex)
            {
                MainManager.Instance.logger.LogException($"{ex.Message}. Response ID = {newGuid}", ex);
                return new JsonResult(base.BuildResponse("Error", ex.Message, newGuid, null));
            }
        }
    }
}
