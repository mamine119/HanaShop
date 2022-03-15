with tblTemp as(select ROW_NUMBER() over ( order by [createDate] asc) as num,[foodId],[foodName],[price],[desciption],[quantity],[status],[createDate],[image],[categoryId],hsd from [dbo].[tblFood] where [foodName] like N'%%' and hsd>=GETDATE() and status=1  and [quantity] > 0 and price >= 123.0
and price <=  140000.0and categoryId = 'S001' ) select [foodId],[foodName],[price],[desciption],[quantity],[status],[createDate],[image],[categoryId],hsd from tblTemp where num between 1 and 20

select ROW_NUMBER() over ( order by [createDate] asc) as num,[foodId],[foodName],[price],[desciption],[quantity],[status],[createDate],[image],[categoryId],hsd from [dbo].[tblFood] where [foodName] like N'%%' and hsd>=GETDATE() and status=1  and [quantity] > 0 and price >= 123.0
and price <=  140000.0and categoryId = 'S001'

select b.foodId,[foodName],[image],b.[quanity],b.[price],[date],b.orderId from [dbo].[tblFood]a,[dbo].[tblOderDetail]b,[dbo].[tblOders]c,[dbo].[tblUsers] d where a.foodId=b.foodId and b.orderId=c.orderId and c.userAccount=d.userAccount and c.orderId in (select c.[orderId] from [dbo].[tblFood]a,[dbo].[tblOderDetail]b,[dbo].[tblOders]c,[dbo].[tblUsers] d where a.foodId=b.foodId and b.orderId=c.orderId and c.userAccount=d.userAccount and d.userAccount ='test' and foodName like N'%%'and [date] = '2022-03-06' group by c.[orderId])

select b.foodId,[foodName],[image],b.[quanity],b.[price],[date],b.orderId from [dbo].[tblFood]a,[dbo].[tblOderDetail]b,[dbo].[tblOders]c,[dbo].[tblUsers] d 
where a.foodId=b.foodId and b.orderId=c.orderId and c.userAccount=d.userAccount and c.orderId in 
(select c.[orderId] from [dbo].[tblFood]a,[dbo].[tblOderDetail]b,[dbo].[tblOders]c,[dbo].[tblUsers]d 
where a.foodId=b.foodId and b.orderId=c.orderId and c.userAccount=d.userAccount and d.userAccount  like N'%t%' and  foodName like N'%%' group by c.[orderId])

select b.foodId,[foodName],[image],b.[quanity],b.[price],[date],b.orderId,e.statusName,d.fullName,d.userAccount from [dbo].[tblFood]a,[dbo].[tblOderDetail]b,[dbo].[tblOders]c,[dbo].[tblUsers] d, [dbo].[tblStatus] e where a.foodId=b.foodId and b.orderId=c.orderId and c.userAccount=d.userAccount and c.statusID=e.statusID and c.orderId in (select c.[orderId] from [dbo].[tblFood]a,[dbo].[tblOderDetail]b,[dbo].[tblOders]c,[dbo].[tblUsers] d where a.foodId=b.foodId and b.orderId=c.orderId and c.userAccount=d.userAccount and d.userAccount ='thanhduy' and  foodName like N'%%' group by c.[orderId]) ORDER BY [date] DESC,orderId DESC


select * from [dbo].[tblStatus]

select b.foodId,[foodName],[image],b.[quanity],b.[price],[date],b.orderId,e.statusName,d.fullName from [dbo].[tblFood]a,[dbo].[tblOderDetail]b,[dbo].[tblOders]c,[dbo].[tblUsers] d, [dbo].[tblStatus] e where a.foodId=b.foodId and b.orderId=c.orderId and c.userAccount=d.userAccount and c.statusID=e.statusID and c.orderId in (select c.[orderId] from [dbo].[tblFood]a,[dbo].[tblOderDetail]b,[dbo].[tblOders]c,[dbo].[tblUsers] d where a.foodId=b.foodId and b.orderId=c.orderId and c.userAccount=d.userAccount and foodName like N'%%'and [date] = '2022-03-07' group by c.[orderId]) ORDER BY [date] DESC

select b.foodId,[foodName],[image],b.[quanity],b.[price],[date],b.orderId,e.statusName from [dbo].[tblFood]a,[dbo].[tblOderDetail]b,[dbo].[tblOders]c,[dbo].[tblUsers] d, [dbo].[tblStatus] e where a.foodId=b.foodId and b.orderId=c.orderId and c.userAccount=d.userAccount and c.statusID=e.statusID and c.orderId in (select c.[orderId] from [dbo].[tblFood]a,[dbo].[tblOderDetail]b,[dbo].[tblOders]c,[dbo].[tblUsers] d where a.foodId=b.foodId and b.orderId=c.orderId and c.userAccount=d.userAccount and d.userAccount ='thanhduy' and  foodName like N'%%' group by c.[orderId]) ORDER BY [date] DESC

UPDATE tblOders
SET statusID=?
WHERE orderId=?

SELECT *
FROM tblUsers
Where  userAccount='admin'

INSERT INTO tblUsers(userAccount,fullName,password,email,address,phone,roleID,status)
VALUES(?,?,?,?,?,?,?,?)