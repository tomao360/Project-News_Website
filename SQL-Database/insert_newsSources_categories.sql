----------------------------INSERT NEWS SOURCES----------------------------
exec InsertNewsSourceToDB
	@sourceName = 'גלובס', 
	@sourceLink = 'https://www.globes.co.il/news/article.aspx?did=851969',
	@logoImage = 'https://images.globes.co.il/rss/Globes_logo_RSS_HEB.png'

exec InsertNewsSourceToDB
	@sourceName = '!וואלה', 
	@sourceLink = 'https://www.walla.co.il/rss',
	@logoImage = 'https://images.wcdn.co.il/f_auto,q_auto,w_300/3/3/3/0/3330736-46.png'

exec InsertNewsSourceToDB
	@sourceName = 'מעריב', 
	@sourceLink = 'https://www.maariv.co.il/rss',
	@logoImage = 'https://www.maariv.co.il/Images/logo-maariv-online.png'

exec InsertNewsSourceToDB
	@sourceName = 'ynet', 
	@sourceLink = 'https://z.ynet.co.il/short/content/RSS/index.html',
	@logoImage = 'https://ynet-pic1.yit.co.il/picserver5/wcm_upload/2021/06/02/BylDa46E900/ynet_menu_logo_2x.png'
---------------------------------------------------------------------------
-----------------------------INSERT CATEGORIES-----------------------------
declare @imageNews varbinary(max)
select @imageNews = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\news.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'חדשות מהארץ ומהעולם' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=9917', 
	@sourceName = 'גלובס',
	@categoryImage = @imageNews

declare @imageOpinions varbinary(max)
select @imageOpinions = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\opinion.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'דעות' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=845', 
	@sourceName = 'גלובס',
	@categoryImage = @imageOpinions

declare @imageConsuption varbinary(max)
select @imageConsuption = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\consuption.png', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'צרכנות' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=821', 
	@sourceName = 'גלובס',
	@categoryImage = @imageConsuption

declare @imageEconomics varbinary(max)
select @imageEconomics = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\economics.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'כלכלה' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=585', 
	@sourceName = 'גלובס',
	@categoryImage = @imageEconomics

declare @imageCars varbinary(max)
select @imageCars = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\car.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'רכב' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=3220', 
	@sourceName = 'גלובס',
	@categoryImage = @imageCars

declare @imageTourism varbinary(max)
select @imageTourism = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tourism.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'תיירות' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iid=9010', 
	@sourceName = 'גלובס',
	@categoryImage = @imageTourism

declare @imageTech varbinary(max)
select @imageTech = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tech.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'טכנולוגיה' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=594', 
	@sourceName = 'גלובס',
	@categoryImage = @imageTech
---------------------------------------
declare @imageNews varbinary(max)
select @imageNews = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\news.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'חדשות מהארץ ומהעולם' , 
	@categoryLink = 'https://rss.walla.co.il/feed/1?type=main', 
	@sourceName = '!וואלה',
	@categoryImage = @imageNews

declare @imageBreakingNews varbinary(max)
select @imageBreakingNews = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\breakingnews.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'מבזקי חדשות' , 
	@categoryLink = 'https://rss.walla.co.il/feed/22', 
	@sourceName = '!וואלה',
	@categoryImage = @imageBreakingNews

declare @imageOpinions varbinary(max)
select @imageOpinions = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\opinion.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'דעות' , 
	@categoryLink = 'https://rss.walla.co.il/feed/4996', 
	@sourceName = '!וואלה',
	@categoryImage = @imageOpinions

declare @imageConsuption varbinary(max)
select @imageConsuption = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\consuption.png', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'צרכנות' , 
	@categoryLink = 'https://rss.walla.co.il/feed/127', 
	@sourceName = '!וואלה',
	@categoryImage = @imageConsuption

declare @imageSport varbinary(max)
select @imageSport = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\sport.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'ספורט' , 
	@categoryLink = 'https://rss.walla.co.il/feed/3?type=main', 
	@sourceName = '!וואלה',
	@categoryImage = @imageSport

declare @imageCulture varbinary(max)
select @imageCulture = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\culture.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'תרבות' , 
	@categoryLink = 'https://rss.walla.co.il/feed/4?type=main', 
	@sourceName = '!וואלה',
	@categoryImage = @imageCulture

declare @imageHealth varbinary(max)
select @imageHealth = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\health.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'בריאות' , 
	@categoryLink = 'https://rss.walla.co.il/feed/139?type=main', 
	@sourceName = '!וואלה',
	@categoryImage = @imageHealth

declare @imageEconomics varbinary(max)
select @imageEconomics = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\economics.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'כלכלה' , 
	@categoryLink = 'https://rss.walla.co.il/feed/2?type=main', 
	@sourceName = '!וואלה',
	@categoryImage = @imageEconomics

declare @imageFood varbinary(max)
select @imageFood = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\food.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'אוכל' , 
	@categoryLink = 'https://rss.walla.co.il/feed/9?type=main', 
	@sourceName = '!וואלה',
	@categoryImage = @imageFood

declare @imageCars varbinary(max)
select @imageCars = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\car.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'רכב' , 
	@categoryLink = 'https://rss.walla.co.il/feed/31?type=main', 
	@sourceName = '!וואלה',
	@categoryImage = @imageCars

declare @imageTourism varbinary(max)
select @imageTourism = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tourism.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'תיירות' , 
	@categoryLink = 'https://rss.walla.co.il/feed/14?type=main', 
	@sourceName = '!וואלה',
	@categoryImage = @imageTourism

declare @imageTech varbinary(max)
select @imageTech = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tech.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'טכנולוגיה' , 
	@categoryLink = 'https://rss.walla.co.il/feed/6?type=main', 
	@sourceName = '!וואלה',
	@categoryImage = @imageTech

declare @imageGossip varbinary(max)
select @imageGossip = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\gossip.png', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'רכילות' , 
	@categoryLink = 'https://rss.walla.co.il/feed/22?type=main', 
	@sourceName = '!וואלה',
	@categoryImage = @imageGossip

declare @imageParents varbinary(max)
select @imageParents = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\parents.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'הורים' , 
	@categoryLink = 'https://rss.walla.co.il/feed/594', 
	@sourceName = '!וואלה',
	@categoryImage = @imageParents

declare @imageScience varbinary(max)
select @imageScience = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\science.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'מדע וסביבה' , 
	@categoryLink = 'https://rss.walla.co.il/feed/5700', 
	@sourceName = '!וואלה',
	@categoryImage = @imageScience
---------------------------------------
declare @imageNews varbinary(max)
select @imageNews = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\news.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'חדשות מהארץ ומהעולם' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssChadashot', 
	@sourceName = 'מעריב',
	@categoryImage = @imageNews

declare @imageBreakingNews varbinary(max)
select @imageBreakingNews = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\breakingnews.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'מבזקי חדשות' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsMivzakiChadashot', 
	@sourceName = 'מעריב',
	@categoryImage = @imageBreakingNews

declare @imageOpinions varbinary(max)
select @imageOpinions = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\opinion.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'דעות' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsOpinions', 
	@sourceName = 'מעריב',
	@categoryImage = @imageOpinions

declare @imageConsuption varbinary(max)
select @imageConsuption = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\consuption.png', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'צרכנות' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsZarchanot', 
	@sourceName = 'מעריב',
	@categoryImage = @imageConsuption

declare @imageSport varbinary(max)
select @imageSport = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\sport.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'ספורט' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsSport', 
	@sourceName = 'מעריב',
	@categoryImage = @imageSport

declare @imageCulture varbinary(max)
select @imageCulture = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\culture.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'תרבות' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsTarbot', 
	@sourceName = 'מעריב',
	@categoryImage = @imageCulture

declare @imageHealth varbinary(max)
select @imageHealth = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\health.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'בריאות' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsBriotVeYeoz', 
	@sourceName = 'מעריב',
	@categoryImage = @imageHealth

declare @imageEconomics varbinary(max)
select @imageEconomics = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\economics.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'כלכלה' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsAsakimBaOlam', 
	@sourceName = 'מעריב',
	@categoryImage = @imageEconomics

declare @imageFood varbinary(max)
select @imageFood = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\food.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'אוכל' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsOchel', 
	@sourceName = 'מעריב',
	@categoryImage = @imageFood

declare @imageCars varbinary(max)
select @imageCars = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\car.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'רכב' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsRechev', 
	@sourceName = 'מעריב',
	@categoryImage = @imageCars

declare @imageTourism varbinary(max)
select @imageTourism = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tourism.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'תיירות' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsTayarot', 
	@sourceName = 'מעריב',
	@categoryImage = @imageTourism

declare @imageTech varbinary(max)
select @imageTech = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tech.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'טכנולוגיה' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsTechnologeya', 
	@sourceName = 'מעריב',
	@categoryImage = @imageTech

declare @imageGossip varbinary(max)
select @imageGossip = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\gossip.png', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'רכילות' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsTMI', 
	@sourceName = 'מעריב',
	@categoryImage = @imageGossip

declare @imageParents varbinary(max)
select @imageParents = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\parents.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'הורים' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsNewParents', 
	@sourceName = 'מעריב',
	@categoryImage = @imageParents

declare @imageScience varbinary(max)
select @imageScience = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\science.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'מדע וסביבה' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsEnvironment', 
	@sourceName = 'מעריב',
	@categoryImage = @imageScience
---------------------------------------
declare @imageNews varbinary(max)
select @imageNews = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\news.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'חדשות מהארץ ומהעולם' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss2.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageNews

declare @imageBreakingNews varbinary(max)
select @imageBreakingNews = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\breakingnews.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'מבזקי חדשות' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss1854.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageBreakingNews

declare @imageOpinions varbinary(max)
select @imageOpinions = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\opinion.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'דעות' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss194.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageOpinions

declare @imageConsuption varbinary(max)
select @imageConsuption = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\consuption.png', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'צרכנות' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss5363.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageConsuption

declare @imageSport varbinary(max)
select @imageSport = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\sport.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'ספורט' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss3.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageSport

declare @imageCulture varbinary(max)
select @imageCulture = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\culture.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'תרבות' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss538.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageCulture

declare @imageHealth varbinary(max)
select @imageHealth = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\health.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'בריאות' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss1208.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageHealth

declare @imageEconomics varbinary(max)
select @imageEconomics = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\economics.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'כלכלה' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss6.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageEconomics

declare @imageFood varbinary(max)
select @imageFood = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\food.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'אוכל' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss975.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageFood

declare @imageCars varbinary(max)
select @imageCars = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\car.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'רכב' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss550.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageCars

declare @imageTourism varbinary(max)
select @imageTourism = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tourism.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'תיירות' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss598.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageTourism

declare @imageTech varbinary(max)
select @imageTech = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tech.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'טכנולוגיה' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss545.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageTech

declare @imageParents varbinary(max)
select @imageParents = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\parents.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'הורים' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss3052.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageParents

declare @imageScience varbinary(max)
select @imageScience = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\science.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = 'מדע וסביבה' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss2142.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageScience