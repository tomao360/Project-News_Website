----------------------------INSERT NEWS SOURCES----------------------------
exec InsertNewsSourceToDB
	@sourceName = '�����', 
	@sourceLink = 'https://www.globes.co.il/news/article.aspx?did=851969',
	@logoImage = 'https://images.globes.co.il/rss/Globes_logo_RSS_HEB.png'

exec InsertNewsSourceToDB
	@sourceName = '!�����', 
	@sourceLink = 'https://www.walla.co.il/rss',
	@logoImage = 'https://images.wcdn.co.il/f_auto,q_auto,w_300/3/3/3/0/3330736-46.png'

exec InsertNewsSourceToDB
	@sourceName = '�����', 
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
	@categoryName = '����� ����� �������' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=9917', 
	@sourceName = '�����',
	@categoryImage = @imageNews

declare @imageOpinions varbinary(max)
select @imageOpinions = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\opinion.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '����' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=845', 
	@sourceName = '�����',
	@categoryImage = @imageOpinions

declare @imageConsuption varbinary(max)
select @imageConsuption = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\consuption.png', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=821', 
	@sourceName = '�����',
	@categoryImage = @imageConsuption

declare @imageEconomics varbinary(max)
select @imageEconomics = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\economics.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=585', 
	@sourceName = '�����',
	@categoryImage = @imageEconomics

declare @imageCars varbinary(max)
select @imageCars = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\car.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '���' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=3220', 
	@sourceName = '�����',
	@categoryImage = @imageCars

declare @imageTourism varbinary(max)
select @imageTourism = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tourism.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iid=9010', 
	@sourceName = '�����',
	@categoryImage = @imageTourism

declare @imageTech varbinary(max)
select @imageTech = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tech.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '���������' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=594', 
	@sourceName = '�����',
	@categoryImage = @imageTech
---------------------------------------
declare @imageNews varbinary(max)
select @imageNews = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\news.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '����� ����� �������' , 
	@categoryLink = 'https://rss.walla.co.il/feed/1?type=main', 
	@sourceName = '!�����',
	@categoryImage = @imageNews

declare @imageBreakingNews varbinary(max)
select @imageBreakingNews = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\breakingnews.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '����� �����' , 
	@categoryLink = 'https://rss.walla.co.il/feed/22', 
	@sourceName = '!�����',
	@categoryImage = @imageBreakingNews

declare @imageOpinions varbinary(max)
select @imageOpinions = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\opinion.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '����' , 
	@categoryLink = 'https://rss.walla.co.il/feed/4996', 
	@sourceName = '!�����',
	@categoryImage = @imageOpinions

declare @imageConsuption varbinary(max)
select @imageConsuption = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\consuption.png', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://rss.walla.co.il/feed/127', 
	@sourceName = '!�����',
	@categoryImage = @imageConsuption

declare @imageSport varbinary(max)
select @imageSport = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\sport.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://rss.walla.co.il/feed/3?type=main', 
	@sourceName = '!�����',
	@categoryImage = @imageSport

declare @imageCulture varbinary(max)
select @imageCulture = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\culture.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://rss.walla.co.il/feed/4?type=main', 
	@sourceName = '!�����',
	@categoryImage = @imageCulture

declare @imageHealth varbinary(max)
select @imageHealth = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\health.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://rss.walla.co.il/feed/139?type=main', 
	@sourceName = '!�����',
	@categoryImage = @imageHealth

declare @imageEconomics varbinary(max)
select @imageEconomics = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\economics.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://rss.walla.co.il/feed/2?type=main', 
	@sourceName = '!�����',
	@categoryImage = @imageEconomics

declare @imageFood varbinary(max)
select @imageFood = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\food.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '����' , 
	@categoryLink = 'https://rss.walla.co.il/feed/9?type=main', 
	@sourceName = '!�����',
	@categoryImage = @imageFood

declare @imageCars varbinary(max)
select @imageCars = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\car.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '���' , 
	@categoryLink = 'https://rss.walla.co.il/feed/31?type=main', 
	@sourceName = '!�����',
	@categoryImage = @imageCars

declare @imageTourism varbinary(max)
select @imageTourism = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tourism.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://rss.walla.co.il/feed/14?type=main', 
	@sourceName = '!�����',
	@categoryImage = @imageTourism

declare @imageTech varbinary(max)
select @imageTech = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tech.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '���������' , 
	@categoryLink = 'https://rss.walla.co.il/feed/6?type=main', 
	@sourceName = '!�����',
	@categoryImage = @imageTech

declare @imageGossip varbinary(max)
select @imageGossip = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\gossip.png', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://rss.walla.co.il/feed/22?type=main', 
	@sourceName = '!�����',
	@categoryImage = @imageGossip

declare @imageParents varbinary(max)
select @imageParents = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\parents.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://rss.walla.co.il/feed/594', 
	@sourceName = '!�����',
	@categoryImage = @imageParents

declare @imageScience varbinary(max)
select @imageScience = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\science.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '��� ������' , 
	@categoryLink = 'https://rss.walla.co.il/feed/5700', 
	@sourceName = '!�����',
	@categoryImage = @imageScience
---------------------------------------
declare @imageNews varbinary(max)
select @imageNews = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\news.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '����� ����� �������' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssChadashot', 
	@sourceName = '�����',
	@categoryImage = @imageNews

declare @imageBreakingNews varbinary(max)
select @imageBreakingNews = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\breakingnews.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '����� �����' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsMivzakiChadashot', 
	@sourceName = '�����',
	@categoryImage = @imageBreakingNews

declare @imageOpinions varbinary(max)
select @imageOpinions = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\opinion.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '����' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsOpinions', 
	@sourceName = '�����',
	@categoryImage = @imageOpinions

declare @imageConsuption varbinary(max)
select @imageConsuption = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\consuption.png', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsZarchanot', 
	@sourceName = '�����',
	@categoryImage = @imageConsuption

declare @imageSport varbinary(max)
select @imageSport = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\sport.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsSport', 
	@sourceName = '�����',
	@categoryImage = @imageSport

declare @imageCulture varbinary(max)
select @imageCulture = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\culture.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsTarbot', 
	@sourceName = '�����',
	@categoryImage = @imageCulture

declare @imageHealth varbinary(max)
select @imageHealth = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\health.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsBriotVeYeoz', 
	@sourceName = '�����',
	@categoryImage = @imageHealth

declare @imageEconomics varbinary(max)
select @imageEconomics = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\economics.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsAsakimBaOlam', 
	@sourceName = '�����',
	@categoryImage = @imageEconomics

declare @imageFood varbinary(max)
select @imageFood = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\food.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '����' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsOchel', 
	@sourceName = '�����',
	@categoryImage = @imageFood

declare @imageCars varbinary(max)
select @imageCars = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\car.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '���' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsRechev', 
	@sourceName = '�����',
	@categoryImage = @imageCars

declare @imageTourism varbinary(max)
select @imageTourism = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tourism.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsTayarot', 
	@sourceName = '�����',
	@categoryImage = @imageTourism

declare @imageTech varbinary(max)
select @imageTech = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tech.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '���������' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsTechnologeya', 
	@sourceName = '�����',
	@categoryImage = @imageTech

declare @imageGossip varbinary(max)
select @imageGossip = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\gossip.png', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsTMI', 
	@sourceName = '�����',
	@categoryImage = @imageGossip

declare @imageParents varbinary(max)
select @imageParents = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\parents.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsNewParents', 
	@sourceName = '�����',
	@categoryImage = @imageParents

declare @imageScience varbinary(max)
select @imageScience = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\science.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '��� ������' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsEnvironment', 
	@sourceName = '�����',
	@categoryImage = @imageScience
---------------------------------------
declare @imageNews varbinary(max)
select @imageNews = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\news.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '����� ����� �������' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss2.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageNews

declare @imageBreakingNews varbinary(max)
select @imageBreakingNews = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\breakingnews.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '����� �����' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss1854.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageBreakingNews

declare @imageOpinions varbinary(max)
select @imageOpinions = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\opinion.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '����' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss194.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageOpinions

declare @imageConsuption varbinary(max)
select @imageConsuption = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\consuption.png', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss5363.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageConsuption

declare @imageSport varbinary(max)
select @imageSport = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\sport.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss3.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageSport

declare @imageCulture varbinary(max)
select @imageCulture = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\culture.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss538.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageCulture

declare @imageHealth varbinary(max)
select @imageHealth = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\health.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss1208.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageHealth

declare @imageEconomics varbinary(max)
select @imageEconomics = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\economics.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss6.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageEconomics

declare @imageFood varbinary(max)
select @imageFood = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\food.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '����' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss975.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageFood

declare @imageCars varbinary(max)
select @imageCars = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\car.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '���' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss550.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageCars

declare @imageTourism varbinary(max)
select @imageTourism = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tourism.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss598.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageTourism

declare @imageTech varbinary(max)
select @imageTech = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tech.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '���������' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss545.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageTech

declare @imageParents varbinary(max)
select @imageParents = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\parents.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss3052.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageParents

declare @imageScience varbinary(max)
select @imageScience = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\science.jpg', single_blob) as ImageData
exec InsertCategoryToDB
	@categoryName = '��� ������' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss2142.xml', 
	@sourceName = 'ynet',
	@categoryImage = @imageScience