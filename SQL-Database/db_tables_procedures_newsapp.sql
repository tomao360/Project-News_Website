------------------------------CREATE DATABASE------------------------------
create database NewsApp
---------------------------------------------------------------------------
-------------------------------CREATE TABLES-------------------------------
---------------News_Source--------------
create table News_Source (SourceID int primary key identity, SourceName nvarchar(100), SourceLink nvarchar(300), LogoImage nvarchar(500))

---------------Categories---------------
create table Categories (CategoryID int primary key identity,
	CategoryName nvarchar(100), CategoryLink nvarchar(300),
	SourceID int foreign key references News_Source (SourceID) on delete cascade,
	CategoryImage varbinary(max))

------------------Users-----------------
create table Users (UserID int primary key identity, Email nvarchar(50) unique)

-------------Users_Categories-----------
create table Users_Categories (UserCategoriyID int primary key identity, 
	UserID int foreign key references Users (UserID) on delete cascade,
	CategoryName1 nvarchar(100), CategoryName2 nvarchar(100), CategoryName3 nvarchar(100))

---------------News_Items---------------
create table News_Items (ItemID int primary key identity,
	Title nvarchar(300), Description nvarchar(max), ItemLink nvarchar(300), Image nvarchar(max), 
	CategoryID int foreign key references Categories (CategoryID) on delete cascade, 
	NumberTimesClicked int, YouTubeLink nvarchar(500))

-----------------Config-----------------
create table Config (ConfigID int primary key identity, ConfigKey nvarchar(100), ConfigValue nvarchar(100))

----------------Logger------------------
create table Logger (LoggerID int primary key identity, 
EventMessage nvarchar(max), ErrorMessage nvarchar(max), Exception nvarchar(max), ExceptionMessage nvarchar(max), LogDate DateTime)
---------------------------------------------------------------------------
--------------------------CREATE STORED PROCEDURES-------------------------
--------------------------------News_Source--------------------------------
---------------------------------------------------------------------------
--Insert into News_Source only when the link not exists in the table using Stored Procedure
---------------------------------------------------------------------------
create procedure InsertNewsSourceToDB
	@sourceName nvarchar(100), 
	@sourceLink nvarchar(300),
	@logoImage nvarchar(500)
as
begin
	declare @sourceID int

	if not exists (select SourceLink from News_Source where SourceLink = @sourceLink)
	begin
		insert into News_Source values(@sourceName, @sourceLink, @logoImage)
		select @sourceID = @@IDENTITY
	end
end
---------------------------------------
drop procedure InsertNewsSourceToDB
---------------------------------------------------------------------------
--delete a News Source by source ID using Stored Procedure
---------------------------------------------------------------------------
create procedure DeleteNewsSourceBySourceID
	@sourceID int
as
begin
   delete from News_Source where SourceID = @sourceID
end
---------------------------------------
drop procedure InsertNewsSourceToDB
---------------------------------------
---------------------------------------------------------------------------
--------------------------------Categories---------------------------------
---------------------------------------------------------------------------
--Insert into Categories only when the link not exists in the table using Stored Procedure
---------------------------------------------------------------------------
create procedure InsertCategoryToDB
	@categoryName nvarchar(100), 
	@categoryLink nvarchar(300), 
	@sourceName nvarchar(100),
	@categoryImage nvarchar(1000)
as
begin
	declare @categoryID int

	if not exists (select CategoryLink from Categories where CategoryLink = @categoryLink)
	begin
		insert into Categories values(@categoryName, @categoryLink,
			(select SourceID from News_Source where SourceName = @sourceName), @categoryImage)
		select @categoryID = @@IDENTITY
	end
end
---------------------------------------
drop procedure InsertCategoryToDB
---------------------------------------------------------------------------
--select all the categories and sources names using Stored Procedure
---------------------------------------------------------------------------
create procedure GetAllCategories
as
begin
	select Categories.*, News_Source.SourceName from Categories 
	inner join News_Source on News_Source.SourceID = Categories.SourceID
end
---------------------------------------
drop procedure GetAllCategories
---------------------------------------------------------------------------
--select all categories names using distinct and Stored Procedure
---------------------------------------------------------------------------
create procedure GetAllCategoriesNames
as
begin
	select distinct CategoryName, CategoryImage from Categories
end
---------------------------------------
drop procedure GetAllCategoriesNames
---------------------------------------------------------------------------
--delete category by category ID using Stored Procedure
---------------------------------------------------------------------------
create procedure DeleteCategoryByCategoryID
	@categoryID int
as
begin
   delete from Categories where CategoryID = @categoryID
end
---------------------------------------
drop procedure DeleteCategoryByCategoryID
---------------------------------------------------------------------------
-----------------------------------Users-----------------------------------
---------------------------------------------------------------------------
--Insert into Users only when the email not exists in the table using Stored Procedure
---------------------------------------------------------------------------
create procedure InsertUserToDB 
	@email nvarchar(50)
as
begin
    declare @userID int

	if not exists (select Email from Users where Email = @email)
	begin
		insert into Users values(@email)
		select @userID = @@IDENTITY
	end
end
---------------------------------------
drop procedure InsertUserToDB
---------------------------------------------------------------------------
--Delete a User by user ID using Stored Procedure
---------------------------------------------------------------------------
create procedure DeleteUserByID
	@userID int
as
begin
   delete from Users where UserID = @userID
end
---------------------------------------
drop procedure DeleteUserByID
---------------------------------------------------------------------------
------------------------------Users_Categories-----------------------------
---------------------------------------------------------------------------
--Insert into Users_Categories only when the email not exists in the Users table, else Update - using Stored Procedure
---------------------------------------------------------------------------
create procedure InsertOrUpdateUserCategoriesInDB
	 @userEmail nvarchar(50),
	 @categoryName1 nvarchar(100),
	 @categoryName2 nvarchar(100),
	 @categoryName3 nvarchar(100)
as
begin
    declare @userCategoriyID int

	if exists (select Users.UserID from Users_Categories  
           inner join Users on Users_Categories.UserID = Users.UserID
           where Users.Email = @userEmail)         
	begin
		update Users_Categories set 
			CategoryName1 = coalesce(@categoryName1, ''), 
			CategoryName2 = coalesce(@categoryName2, ''), 
			CategoryName3 = coalesce(@categoryName3, '')
		where UserID = (select UserID from Users where Email = @userEmail)
	end
	else
	begin
		insert into Users_Categories values((select UserID from Users where Email = @userEmail),
			coalesce(@categoryName1, ''), coalesce(@categoryName2, ''), coalesce(@categoryName3, ''))	
		select @userCategoriyID = @@IDENTITY
	end
end
---------------------------------------
drop procedure InsertOrUpdateUserCategoriesInDB
---------------------------------------------------------------------------
---------------------------------News_Items--------------------------------
--Create a type of table to insert to the News_Items table
---------------------------------------------------------------------------
create type NewsItemsTableType as table (
    Title nvarchar(300),
    Description nvarchar(max),
    ItemLink nvarchar(300),
    Image nvarchar(500),
    CategoryName nvarchar(100),
    SourceName nvarchar(100)
)
---------------------------------------
drop type NewsItemsTableType 
---------------------------------------------------------------------------
--Insert into News_Items only when the link not exists to a category in the table using Stored Procedure
---------------------------------------------------------------------------
create procedure InsertNewsItemToDB
    @newsItems NewsItemsTableType READONLY
as
begin
    declare @itemID int

    insert into News_Items (Title, Description, ItemLink, Image, CategoryID, NumberTimesClicked)
    select ni.Title, ni.Description, ni.ItemLink, ni.Image, Categories.CategoryID, 0
    FROM @newsItems ni
    inner join Categories ON Categories.CategoryName = ni.CategoryName
    inner join News_Source ON News_Source.SourceName = ni.SourceName and News_Source.SourceID = Categories.SourceID
    where not exists (select 1 from News_Items where News_Items.ItemLink = ni.ItemLink and News_Items.CategoryID = Categories.CategoryID);

    select @itemID = @@IDENTITY
end
---------------------------------------
drop procedure InsertNewsItemToDB
---------------------------------------------------------------------------
--Update News_Items -> ADD NumberTimesClicked by 1 using stored procedure
---------------------------------------------------------------------------
create procedure UpdateNewItemNumberTimesClicked
	@itemID int
as
begin
	update News_Items set NumberTimesClicked = NumberTimesClicked + 1
	where ItemID = @itemID
end
---------------------------------------
drop procedure UpdateNewItemNumberTimesClicked
---------------------------------------------------------------------------
--Select the Items based on the user categories choices using stored procedure
---------------------------------------------------------------------------
create procedure GetAllNewsItemsForUser
	@userEmail nvarchar(50)
as
begin
	select News_Items.*, Categories.CategoryName, News_Source.LogoImage from News_Items 
	inner join Categories on News_Items.CategoryID = Categories.CategoryID
	inner join News_Source on Categories.SourceID = News_Source.SourceID
	inner join Users_Categories on (Categories.CategoryName = Users_Categories.CategoryName1 
									or Categories.CategoryName = Users_Categories.CategoryName2 
									or Categories.CategoryName = Users_Categories.CategoryName3)
	inner join Users on Users_Categories.UserID = Users.UserID
	where Users.Email = @userEmail
		and ItemID in (
				select top 10 ItemID from News_Items AS NI
				where NI.CategoryID = News_Items.CategoryID
				order by NI.ItemID desc
			)
end
---------------------------------------
drop procedure GetAllNewsItemsForUser
---------------------------------------------------------------------------
--Select the 10 most popular News Items from the users categories using stored procedure
---------------------------------------------------------------------------
create procedure Get10MostPopularNewsItems
	@userEmail nvarchar(50)
as
begin
	select top 10 News_Items.*, News_Source.LogoImage from News_Items 
	inner join Categories on News_Items.CategoryID = Categories.CategoryID
	inner join News_Source on Categories.SourceID = News_Source.SourceID
	inner join Users_Categories on (Categories.CategoryName = Users_Categories.CategoryName1 
									or Categories.CategoryName = Users_Categories.CategoryName2 
									or Categories.CategoryName = Users_Categories.CategoryName3)
	inner join Users on Users_Categories.UserID = Users.UserID
	where Users.Email = @userEmail and NumberTimesClicked > 0
	order by NumberTimesClicked desc
end
---------------------------------------
drop procedure Get10MostPopularNewsItems
---------------------------------------------------------------------------
--Select randomly 10 not popular News Items from the users categories using stored procedure
---------------------------------------------------------------------------
create procedure Get10RandomNotPopularNewsItems
	@userEmail nvarchar(50)
as
begin
	select top 10 News_Items.*, News_Source.LogoImage from News_Items 
	inner join Categories on News_Items.CategoryID = Categories.CategoryID
	inner join News_Source on Categories.SourceID = News_Source.SourceID
	inner join Users_Categories on (Categories.CategoryName = Users_Categories.CategoryName1 
									or Categories.CategoryName = Users_Categories.CategoryName2 
									or Categories.CategoryName = Users_Categories.CategoryName3)
	inner join Users on Users_Categories.UserID = Users.UserID
	where Users.Email = @userEmail and NumberTimesClicked = 0
	order by newid()
end
---------------------------------------
drop procedure Get10RandomNotPopularNewsItems
---------------------------------------------------------------------------
--Delete an mews item by item ID using Stored Procedure
---------------------------------------------------------------------------
create procedure DeleteNewsItemByID
	@itemID int
as
begin
   delete from News_Items where ItemID = @itemID
end
---------------------------------------
drop procedure DeleteNewsItemByID
---------------------------------------------------------------------------
--Select popular News Items for YouTube using stored procedure
---------------------------------------------------------------------------
create procedure GetPopularNewsItemsForYouTube
as
begin 
	select News_Items.ItemID, News_Items.Title, News_Items.YouTubeLink from News_Items 
	inner join Categories on News_Items.CategoryID = Categories.CategoryID
	inner join News_Source on Categories.SourceID = News_Source.SourceID
	where NumberTimesClicked > 0
	order by NumberTimesClicked desc
end
---------------------------------------
drop procedure GetPopularNewsItemsForYouTube
---------------------------------------------------------------------------
--Update YouTubeLink in News_Items table using stored procedure
---------------------------------------------------------------------------
create procedure UpdateTouTubeLink
	@itemID int,
	@youtubeLink nvarchar(500)
as
begin
	update News_Items set YouTubeLink = @youtubeLink
	where ItemID = @itemID
end
---------------------------------------
drop procedure UpdateTouTubeLink
---------------------------------------------------------------------------
--------------------------------DROP TABLES--------------------------------
drop table News_Source
drop table Categories
drop table Users
drop table Users_Categories
drop table News_Items
drop table Logger
drop table Config