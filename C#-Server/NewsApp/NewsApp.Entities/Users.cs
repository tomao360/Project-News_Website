﻿using NewsApp.Entities.Base;
using NewsApp.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace NewsApp.Entities
{
    public class Users: BaseEntity
    {
        public Users(Logger log) : base(log) { }

        public Dictionary<int, User> GetAllUsersFromDB()
        {
            Dictionary<int, User> usersDic = null;
            try
            {
                Data.Sql.UserSql userSql = new Data.Sql.UserSql(base.Log);
                usersDic = (Dictionary<int, User>)userSql.LoadUsers();
            }
            catch (Exception ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
            }

            return usersDic;
        }


        public void InsertUserToDB(string email)
        {
            try
            {
                Data.Sql.UserSql userSql = new Data.Sql.UserSql(base.Log);
                userSql.InsertUserToDB(email);
            }
            catch (Exception ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
            }
        }

        public void InsertOrUpdateUserCategories(string userEmail, string categoryName1, string categoryName2, string categoryName3)
        {
            try
            {
                Data.Sql.UserCategorySql userCategorySql = new Data.Sql.UserCategorySql(base.Log);
                userCategorySql.InsertOrUpdateUserCategoriesInDB(userEmail, categoryName1, categoryName2, categoryName3);
            }
            catch (Exception ex)
            {
                Log.LogException(ex.Message, ex);
                throw;
            }
        }
    }
}
