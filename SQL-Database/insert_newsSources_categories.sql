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
---
declare @imageBreakingNews varbinary(max)
select @imageBreakingNews = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\breakingnews.jpg', single_blob) as ImageData
---
declare @imageOpinions varbinary(max)
select @imageOpinions = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\opinion.jpg', single_blob) as ImageData
---
declare @imageConsuption varbinary(max)
select @imageConsuption = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\consuption.png', single_blob) as ImageData
---
declare @imageSport varbinary(max)
select @imageSport = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\sport.jpg', single_blob) as ImageData
---
declare @imageCulture varbinary(max)
select @imageCulture = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\culture.jpg', single_blob) as ImageData
---
declare @imageHealth varbinary(max)
select @imageHealth = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\health.jpg', single_blob) as ImageData
---
declare @imageEconomics varbinary(max)
select @imageEconomics = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\economics.jpg', single_blob) as ImageData
---
declare @imageFood varbinary(max)
select @imageFood = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\food.jpg', single_blob) as ImageData
---
declare @imageCars varbinary(max)
select @imageCars = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\car.jpg', single_blob) as ImageData
---
declare @imageTourism varbinary(max)
select @imageTourism = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tourism.jpg', single_blob) as ImageData
---
declare @imageTech varbinary(max)
select @imageTech = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\tech.jpg', single_blob) as ImageData
---
declare @imageGossip varbinary(max)
select @imageGossip = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\gossip.png', single_blob) as ImageData
---
declare @imageParents varbinary(max)
select @imageParents = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\parents.jpg', single_blob) as ImageData
---
declare @imageScience varbinary(max)
select @imageScience = BulkColumn
from openrowset(bulk 'D:\Programming\Zionet\NewsApp_Project\SQL-Database\images\science.jpg', single_blob) as ImageData

exec InsertCategoryToDB
	@categoryName = '����� ����� �������' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=9917', 
	@sourceName = '�����',
	@categoryImage = 'https://img.freepik.com/premium-vector/abstract-background-3d-globe-sphere-dotted-world-map-futuristic-style_34645-1144.jpg'

exec InsertCategoryToDB
	@categoryName = '����' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=845', 
	@sourceName = '�����',
	@categoryImage = 'https://englishexplorations.check.uni-hamburg.de/wp-content/uploads/2018/11/Opinion.png'

exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=821', 
	@sourceName = '�����',
	@categoryImage = 'https://cdn.corporatefinanceinstitute.com/assets/Consumption.jpeg'

exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=585', 
	@sourceName = '�����',
	@categoryImage = 'https://www.shutterstock.com/image-photo/hot-business-growth-businessman-using-260nw-1425205367.jpg'

exec InsertCategoryToDB
	@categoryName = '���' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=3220', 
	@sourceName = '�����',
	@categoryImage = 'https://www.shutterstock.com/image-illustration/modern-cars-studio-room-3d-260nw-735402217.jpg'

exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iid=9010', 
	@sourceName = '�����',
	@categoryImage = 'https://www.laingbuissonnews.com/wp-content/uploads/sites/3/2021/02/travel-tourism-city-landmarks_1.jpg'

exec InsertCategoryToDB
	@categoryName = '���������' , 
	@categoryLink = 'https://www.globes.co.il/webservice/rss/rssfeeder.asmx/FeederNode?iID=594', 
	@sourceName = '�����',
	@categoryImage = 'https://img.freepik.com/premium-photo/tech-devices-icons-connected-digital-planet-earth_117023-449.jpg'
---------------------------------------
exec InsertCategoryToDB
	@categoryName = '����� ����� �������' , 
	@categoryLink = 'https://rss.walla.co.il/feed/1?type=main', 
	@sourceName = '!�����',
	@categoryImage = 'https://img.freepik.com/premium-vector/abstract-background-3d-globe-sphere-dotted-world-map-futuristic-style_34645-1144.jpg'

exec InsertCategoryToDB
	@categoryName = '����� �����' , 
	@categoryLink = 'https://rss.walla.co.il/feed/22', 
	@sourceName = '!�����',
	@categoryImage = 'https://mycalcas.com/wp-content/uploads/2017/09/Megaphone-1080x675.png'

exec InsertCategoryToDB
	@categoryName = '����' , 
	@categoryLink = 'https://rss.walla.co.il/feed/4996', 
	@sourceName = '!�����',
	@categoryImage = 'https://englishexplorations.check.uni-hamburg.de/wp-content/uploads/2018/11/Opinion.png'

exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://rss.walla.co.il/feed/127', 
	@sourceName = '!�����',
	@categoryImage = 'https://cdn.corporatefinanceinstitute.com/assets/Consumption.jpeg'

exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://rss.walla.co.il/feed/3?type=main', 
	@sourceName = '!�����',
	@categoryImage = 'https://thumbs.dreamstime.com/b/sport-equipment-2-22802518.jpg'

exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://rss.walla.co.il/feed/4?type=main', 
	@sourceName = '!�����',
	@categoryImage = 'https://cdn.xxl.thumbs.canstockphoto.com/earth-multicultural-children-hand-in-hand-vector-clip-art_csp10254811.jpg'

exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://rss.walla.co.il/feed/139?type=main', 
	@sourceName = '!�����',
	@categoryImage = 'https://www.shutterstock.com/image-photo/medicine-doctor-stethoscope-touching-icon-260nw-1022274595.jpg'

exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://rss.walla.co.il/feed/2?type=main', 
	@sourceName = '!�����',
	@categoryImage = 'https://www.shutterstock.com/image-photo/hot-business-growth-businessman-using-260nw-1425205367.jpg'

exec InsertCategoryToDB
	@categoryName = '����' , 
	@categoryLink = 'https://rss.walla.co.il/feed/9?type=main', 
	@sourceName = '!�����',
	@categoryImage = 'https://thumbs.dreamstime.com/b/healthy-food-selection-healthy-food-selection-fruits-vegetables-seeds-superfood-cereals-gray-background-121936825.jpg'

exec InsertCategoryToDB
	@categoryName = '���' , 
	@categoryLink = 'https://rss.walla.co.il/feed/31?type=main', 
	@sourceName = '!�����',
	@categoryImage = 'https://www.shutterstock.com/image-illustration/modern-cars-studio-room-3d-260nw-735402217.jpg'

exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://rss.walla.co.il/feed/14?type=main', 
	@sourceName = '!�����',
	@categoryImage = 'https://www.laingbuissonnews.com/wp-content/uploads/sites/3/2021/02/travel-tourism-city-landmarks_1.jpg'

exec InsertCategoryToDB
	@categoryName = '���������' , 
	@categoryLink = 'https://rss.walla.co.il/feed/6?type=main', 
	@sourceName = '!�����',
	@categoryImage = 'https://img.freepik.com/premium-photo/tech-devices-icons-connected-digital-planet-earth_117023-449.jpg'

exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://rss.walla.co.il/feed/22?type=main', 
	@sourceName = '!�����',
	@categoryImage = 'https://t4.ftcdn.net/jpg/01/69/07/13/360_F_169071381_8RGLogletoMJ8IaHAQTHcCR7LiIlEEeD.jpg'

exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://rss.walla.co.il/feed/594', 
	@sourceName = '!�����',
	@categoryImage = 'http://us.123rf.com/450wm/yanlev/yanlev1305/yanlev130500034/19774073-silhouettes-of-happy-parents-having-good-time-with-their-little-children-on-the-seacoast.jpg'

exec InsertCategoryToDB
	@categoryName = '��� ������' , 
	@categoryLink = 'https://rss.walla.co.il/feed/5700', 
	@sourceName = '!�����',
	@categoryImage = 'https://wallpaperaccess.com/full/3635104.jpg'
---------------------------------------
exec InsertCategoryToDB
	@categoryName = '����� ����� �������' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssChadashot', 
	@sourceName = '�����',
	@categoryImage = 'https://img.freepik.com/premium-vector/abstract-background-3d-globe-sphere-dotted-world-map-futuristic-style_34645-1144.jpg'

exec InsertCategoryToDB
	@categoryName = '����� �����' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsMivzakiChadashot', 
	@sourceName = '�����',
	@categoryImage = 'https://mycalcas.com/wp-content/uploads/2017/09/Megaphone-1080x675.png'

exec InsertCategoryToDB
	@categoryName = '����' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsOpinions', 
	@sourceName = '�����',
	@categoryImage = 'https://englishexplorations.check.uni-hamburg.de/wp-content/uploads/2018/11/Opinion.png'

exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsZarchanot', 
	@sourceName = '�����',
	@categoryImage = 'https://cdn.corporatefinanceinstitute.com/assets/Consumption.jpeg'

exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsSport', 
	@sourceName = '�����',
	@categoryImage = 'https://thumbs.dreamstime.com/b/sport-equipment-2-22802518.jpg'

exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsTarbot', 
	@sourceName = '�����',
	@categoryImage = 'https://cdn.xxl.thumbs.canstockphoto.com/earth-multicultural-children-hand-in-hand-vector-clip-art_csp10254811.jpg'

exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsBriotVeYeoz', 
	@sourceName = '�����',
	@categoryImage = 'https://www.shutterstock.com/image-photo/medicine-doctor-stethoscope-touching-icon-260nw-1022274595.jpg'

exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsAsakimBaOlam', 
	@sourceName = '�����',
	@categoryImage = 'https://www.shutterstock.com/image-photo/hot-business-growth-businessman-using-260nw-1425205367.jpg'

exec InsertCategoryToDB
	@categoryName = '����' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsOchel', 
	@sourceName = '�����',
	@categoryImage = 'https://thumbs.dreamstime.com/b/healthy-food-selection-healthy-food-selection-fruits-vegetables-seeds-superfood-cereals-gray-background-121936825.jpg'

exec InsertCategoryToDB
	@categoryName = '���' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsRechev', 
	@sourceName = '�����',
	@categoryImage = 'https://www.shutterstock.com/image-illustration/modern-cars-studio-room-3d-260nw-735402217.jpg'

exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsTayarot', 
	@sourceName = '�����',
	@categoryImage = 'https://www.laingbuissonnews.com/wp-content/uploads/sites/3/2021/02/travel-tourism-city-landmarks_1.jpg'

exec InsertCategoryToDB
	@categoryName = '���������' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsTechnologeya', 
	@sourceName = '�����',
	@categoryImage = 'https://img.freepik.com/premium-photo/tech-devices-icons-connected-digital-planet-earth_117023-449.jpg'

exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsTMI', 
	@sourceName = '�����',
	@categoryImage = 'https://t4.ftcdn.net/jpg/01/69/07/13/360_F_169071381_8RGLogletoMJ8IaHAQTHcCR7LiIlEEeD.jpg'

exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsNewParents', 
	@sourceName = '�����',
	@categoryImage = 'http://us.123rf.com/450wm/yanlev/yanlev1305/yanlev130500034/19774073-silhouettes-of-happy-parents-having-good-time-with-their-little-children-on-the-seacoast.jpg'

exec InsertCategoryToDB
	@categoryName = '��� ������' , 
	@categoryLink = 'https://www.maariv.co.il/Rss/RssFeedsEnvironment', 
	@sourceName = '�����',
	@categoryImage = 'https://wallpaperaccess.com/full/3635104.jpg'
---------------------------------------
exec InsertCategoryToDB
	@categoryName = '����� ����� �������' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss2.xml', 
	@sourceName = 'ynet',
	@categoryImage = 'https://img.freepik.com/premium-vector/abstract-background-3d-globe-sphere-dotted-world-map-futuristic-style_34645-1144.jpg'

exec InsertCategoryToDB
	@categoryName = '����� �����' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss1854.xml', 
	@sourceName = 'ynet',
	@categoryImage = 'https://mycalcas.com/wp-content/uploads/2017/09/Megaphone-1080x675.png'

exec InsertCategoryToDB
	@categoryName = '����' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss194.xml', 
	@sourceName = 'ynet',
	@categoryImage = 'https://englishexplorations.check.uni-hamburg.de/wp-content/uploads/2018/11/Opinion.png'

exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss5363.xml', 
	@sourceName = 'ynet',
	@categoryImage = 'https://cdn.corporatefinanceinstitute.com/assets/Consumption.jpeg'

exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss3.xml', 
	@sourceName = 'ynet',
	@categoryImage = 'https://thumbs.dreamstime.com/b/sport-equipment-2-22802518.jpg'

exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss538.xml', 
	@sourceName = 'ynet',
	@categoryImage = 'https://cdn.xxl.thumbs.canstockphoto.com/earth-multicultural-children-hand-in-hand-vector-clip-art_csp10254811.jpg'

exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss1208.xml', 
	@sourceName = 'ynet',
	@categoryImage = 'https://www.shutterstock.com/image-photo/medicine-doctor-stethoscope-touching-icon-260nw-1022274595.jpg'

exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss6.xml', 
	@sourceName = 'ynet',
	@categoryImage = 'https://www.shutterstock.com/image-photo/hot-business-growth-businessman-using-260nw-1425205367.jpg'

exec InsertCategoryToDB
	@categoryName = '����' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss975.xml', 
	@sourceName = 'ynet',
	@categoryImage = 'https://thumbs.dreamstime.com/b/healthy-food-selection-healthy-food-selection-fruits-vegetables-seeds-superfood-cereals-gray-background-121936825.jpg'

exec InsertCategoryToDB
	@categoryName = '���' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss550.xml', 
	@sourceName = 'ynet',
	@categoryImage = 'https://www.shutterstock.com/image-illustration/modern-cars-studio-room-3d-260nw-735402217.jpg'

exec InsertCategoryToDB
	@categoryName = '������' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss598.xml', 
	@sourceName = 'ynet',
	@categoryImage = 'https://www.laingbuissonnews.com/wp-content/uploads/sites/3/2021/02/travel-tourism-city-landmarks_1.jpg'

exec InsertCategoryToDB
	@categoryName = '���������' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss545.xml', 
	@sourceName = 'ynet',
	@categoryImage = 'https://img.freepik.com/premium-photo/tech-devices-icons-connected-digital-planet-earth_117023-449.jpg'

exec InsertCategoryToDB
	@categoryName = '�����' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss3052.xml', 
	@sourceName = 'ynet',
	@categoryImage = 'http://us.123rf.com/450wm/yanlev/yanlev1305/yanlev130500034/19774073-silhouettes-of-happy-parents-having-good-time-with-their-little-children-on-the-seacoast.jpg'

exec InsertCategoryToDB
	@categoryName = '��� ������' , 
	@categoryLink = 'http://www.ynet.co.il/Integration/StoryRss2142.xml', 
	@sourceName = 'ynet',
	@categoryImage = 'https://wallpaperaccess.com/full/3635104.jpg'