CREATE DATABASE [project1]
GO

USE [project1]
go


CREATE TABLE [dbo].[User](
	[user_id] [int] NOT NULL,
	[first_name] [varchar](25) NOT NULL,
	[last_name] [varchar](25) NOT NULL,
	[user_name] [varchar](25) NOT NULL,
	[date_of_birth] [date] NULL,
	[gender] [char](1) NULL,
	[contact_number] bigint NOT NULL,
	[adress_id] [int] NOT NULL,
	[email_id] [varchar] (30) NOT NULL,
	[password] [varchar] (30) NOT NULL,
	EncryptedPassword varchar(250) NOT NULL,
	[hint_question] [varchar] (100) NOT NULL,
	[hint_answer] [varchar] (20) NOT NULL,
	check(Gender in ('M', 'F')),
	CONSTRAINT [prim_userid] PRIMARY KEY CLUSTERED 
([user_id] ASC
)
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX USER_INDEX ON [User](first_Name,last_Name); 

CREATE SEQUENCE user_seq
  START WITH 10
  INCREMENT BY 1; 




CREATE TABLE [dbo].[Product](
	[product_id] [int] NOT NULL,
	[product_name] [varchar] (25) NOT NULL,
	[product_price]  DECIMAL(6,2) NOT NULL,
	[product_quantity] [int] NOT NULL,
	[product_description] [varchar] (100) NULL,
	[supplier_id] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	CONSTRAINT [prim_product] PRIMARY KEY CLUSTERED 
([product_id] ASC
)
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX PRODUCTID_INDEX ON Product(Product_Name); 

CREATE SEQUENCE product_seq
  START WITH 10
  INCREMENT BY 1;


CREATE TABLE Supplier(
supplier_id [int] NOT NULL,
supplier_name [varchar] (250) NOT NULL,
supplier_address_id [int] NOT NULL, 
supplier_no [bigint],
CONSTRAINT [prim_supplier] PRIMARY KEY CLUSTERED 
([supplier_id] ASC
)
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX SUPPLIER_INDEX ON Supplier(Supplier_Name); 

CREATE TABLE [dbo].[Brand](
	[brand_id] [int] NOT NULL,
	[brand_name] [varchar] (25) NOT NULL,
	CONSTRAINT [prim_brand] PRIMARY KEY CLUSTERED 
([brand_id] ASC
)
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX Brand_Indx ON Brand(Brand_Name); 

CREATE TABLE [dbo].[Category](
	[category_id] [int] NOT NULL,
	[category_name] [varchar] (25) NOT NULL,
	[category_description] [varchar] (100) NULL,
	CONSTRAINT [prim_category] PRIMARY KEY CLUSTERED 
([category_id] ASC
)
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX CATEGORYID_INDEX ON Category(Category_Name); 

ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [foreign_prodcut_supplier] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Supplier] ([supplier_id])
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [foreign_prodcut_supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [foreign_prodcut_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([brand_id])
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [foreign_prodcut_brand]
GO

ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [foreign_prodcut_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [foreign_prodcut_category]
GO

CREATE TABLE [dbo].[OrderLine](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[product_price]  DECIMAL(6,2) NOT NULL,
	[quantity] [int] NOT NULL,
	[discount] [int] NULL,
	CONSTRAINT [prim_order_line] PRIMARY KEY CLUSTERED 
([order_id] ASC,
[product_id] ASC
)
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX ORDER_DETAILS_INDEX ON OrderLine(quantity);  

CREATE TABLE [dbo].[Order](
	[order_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[order_amount]  DECIMAL(6,2) NOT NULL,
	[discount] [int] NULL,
	[tax_amount] [int] NULL,
	[shipping_date] [int] NOT NULL,
	[shipping_id] [int] NOT NULL,
	[billing_id] [int] NULL,
	[status_id] [varchar] (20) NOT NULL,
	CONSTRAINT [prim_order] PRIMARY KEY CLUSTERED 
([order_id] ASC
)
) ON [PRIMARY]
GO


ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [foreign_order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [foreign_order_id]
GO

ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [foreign_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [foreign_product_id]
GO

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [foreign_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [foreign_user_id]
GO

CREATE TABLE [dbo].[Address](
	[address_id] [int] NOT NULL,
	[apt_no] [varchar] (10) NOT NULL,
	[street] [varchar] (50) NOT NULL,
	[city] [varchar] (25) NOT NULL,
	[state] [varchar] (25) NOT NULL,
	[zipcode] [int] NOT NULL,
	CONSTRAINT [prim_address] PRIMARY KEY CLUSTERED 
([address_id] ASC
)
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX ADDRESS_INDEX ON Address(apt_No,street,city);

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [foreign_shipping_id] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Address] ([address_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [foreign_shipping_id]
GO

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [foreign_billing_id] FOREIGN KEY([billing_id])
REFERENCES [dbo].[Address] ([address_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [foreign_billing_id]
GO


ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [foreign_supplier] FOREIGN KEY([supplier_address_id])
REFERENCES [dbo].[Address] ([address_id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [foreign_supplier]
GO


CREATE MASTER KEY ENCRYPTION BY 
PASSWORD = 'abc123'
GO
CREATE CERTIFICATE TestCert
   WITH SUBJECT = 'Password Encryption';
GO
CREATE SYMMETRIC KEY UserKey
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE TestCert;
GO
OPEN SYMMETRIC KEY UserKey
   DECRYPTION BY CERTIFICATE TestCert;
UPDATE [User]
   SET [EncryptedPassword] = EncryptByKey(Key_GUID('UserKey'), password);
GO

ALTER TABLE [Order] DROP COLUMN shipping_date;
ALTER TABLE [Order] ADD shipping_date date;




------------------------------VIEWS----------------------------------------------------


CREATE VIEW MostFrequentlyBoughtProduct AS
SELECT A.product_id, B.product_name, COUNT(A.product_id) As ProductCount FROM OrderLine A join Product B On A.product_id=B.product_id where order_id in 
(select order_id from [Order] where status_id ='Delivered') GROUP BY A.product_id,B.product_name HAVING COUNT (A.product_id)
=(SELECT MAX(mycount) FROM ( SELECT product_id, COUNT(product_id) mycount 
FROM OrderLine  where order_id in 
(select Order_Id from [Order] where status_id='Delivered')GROUP BY product_id)as maxcount);

select * from MostFrequentlyBoughtProduct;

-------------------------------------------------------------------------------------------------


Create View MostFrequentlyBoughtCategory AS
SELECT B.category_id,C.Category_Name,COUNT(B.category_id) As ProductCategoryCount FROM OrderLine A join Product B on A.Product_Id=B.Product_Id
join Category C on B.category_id=C.Category_Id
GROUP BY B.category_id,C.Category_Name HAVING COUNT (B.category_id)
=(SELECT MAX(mycount) FROM ( SELECT category_id, COUNT(category_id) mycount 
FROM Product A join OrderLine B on A.Product_Id=B.Product_Id GROUP BY category_id)as maxcount);


select * from MostFrequentlyBoughtCategory;

---------------------------------------------------------------------------------------------------

Create View MostFrequentlyBoughtBrand AS
SELECT B.brand_id ,C.Brand_Name,COUNT(B.brand_id) As ProductBrandCount FROM OrderLine A join Product B on A.Product_Id=B.Product_Id
join Brand C on C.Brand_Id=B.brand_id
GROUP BY B.brand_id,C.Brand_Name HAVING COUNT (B.brand_id)
=(SELECT MAX(mycount) FROM ( SELECT brand_id, COUNT(brand_id) mycount 
FROM Product A join OrderLine B on A.Product_Id=B.Product_Id GROUP BY brand_id)as maxcount);

select * from MostFrequentlyBoughtBrand;


---------------------------------------------------------------------------------------------------------

Create View TopSeller AS
SELECT C.supplier_id, C.supplier_name, COUNT(C.supplier_id) AS NumberOfProducts FROM OrderLine A join Product B on A.product_id = B.product_id
join Supplier C on B.supplier_id = C.supplier_id WHERE B.category_id='4' GROUP BY C.supplier_id, C.supplier_name

SELECT * FROM TopSeller


----------------------------------PROCEDURES-----------------------------------------------------------



DECLARE @product_count INT;

create Procedure ListOfAllOrders
@user_id int, 
@product_count int output
AS
BEGIN
select A.order_id, A.user_id, A.order_date, A.order_amount, A.shipping_date, A.status_id, B.product_id, B.product_price from [Order] A join OrderLine B on A.order_id=B.order_id
where A.status_id='Delivered' and A.user_id=@user_id;
    SELECT @product_count = @@ROWCOUNT;
End
GO


DECLARE @count INT;
Exec ListOfAllOrders @user_id ='15', @product_count = @count OUTPUT;



---Drop procedure ListOfAllOrders;
---GO


Create Procedure ListAllOrdersOfACustomer
@user_id int, 
@product_count int output
AS
BEGIN
select A.order_id, A.user_id, C.supplier_id, A.order_date, A.order_amount, A.discount, A.tax_amount, A.shipping_date, A.status_id, B.product_id, C.product_quantity,
B.product_price from [Order] A join OrderLine B on A.order_id=B.order_id join Product C On B.product_id=C.product_id 
where A.status_id='Delivered' and A.user_id=@user_id;
End
GO

DECLARE @count INT;
Exec ListAllOrdersOfACustomer @user_id ='15', @product_count = @count OUTPUT;



---DROP PROCEDURE ListAllOrdersOfACustomer;  
--GO


Create procedure CountOfSoldProducts
@product_id int,
@product_count int output
AS
BEGIN
Select A.product_id, B.product_name, A.order_id, B.supplier_id, C.user_id, COUNT(A.product_id) As ProductCount from OrderLine A join Product B On A.product_id=B.product_id 
join [Order] C on C.order_id=A.order_id where A.product_id=@product_id GROUP BY A.product_id,B.product_name, A.order_id, C.user_id, B.supplier_id;
End
GO

DECLARE @count INT;
Exec CountOfSoldProducts @product_id=11, @product_count = @count OUTPUT;

--DROP PROCEDURE CountOfSoldProducts;  
--GO




------------------------------------------------TRIGGERS------------------------------------------------------

Create table OrderchangeAudit(
OrderAuditId int primary key,
[order_id] [int] not null,
[product_id] [int] NOT NULL,
[product_price]  DECIMAL(6,2) NOT NULL,
[quantity] [int] NOT NULL,
[discount] [int] NULL,
Action char(1),
ActionDate datetime);

CREATE SEQUENCE order_audit_seq
  START WITH 1
  INCREMENT BY 1;

CREATE TRIGGER OrderLineChanges on [OrderLine]
FOR UPDATE 
AS 
BEGIN
INSERT INTO [OrderchangeAudit]( 
       [OrderAuditId],
	   [order_id], 
       [product_id],
       [product_price],  
       [quantity],
       [discount],
       [Action],
      [ActionDate])
 select (Next Value For order_audit_seq),d.order_id,d.product_id,d.product_price,d.quantity,d.discount,'U',GETDATE()
From deleted d   
END
Go

Update OrderLine set quantity = 4 where order_id=11;
select * from OrderchangeAudit;
select * from OrderLine;


----------------------------------------------------------------------------------------------------------------


Create Table UsersAudit(
UserAuditId int primary key ,
[user_id] [int] NOT NULL,
	[first_name] [varchar](25) NOT NULL,
	[last_name] [varchar](25) NOT NULL,
	[user_name] [varchar](25) NOT NULL,
	[date_of_birth] [date] NULL,
	[gender] [char](1) NULL,
	[contact_number] bigint NOT NULL,
	[adress_id] [int] NOT NULL,
	[email_id] [varchar] (30) NOT NULL,
	[password] [varchar] (30) NOT NULL,
	EncryptedPassword varchar(250) NOT NULL,
	[hint_question] [varchar] (100) NOT NULL,
	[hint_answer] [varchar] (20) NOT NULL,
	check(Gender in ('M', 'F')),
[Action] char(1),
ActionDate datetime);
GO

CREATE SEQUENCE user_audit_seq
  START WITH 1
  INCREMENT BY 1; 

CREATE TRIGGER UserChanges on [User]
FOR UPDATE 
AS 
BEGIN
INSERT INTO [UsersAudit]( 
[UserAuditId],
      [user_id],
	[first_name],
	[last_name],
	[user_name],
	[date_of_birth],
	[gender],
	[contact_number],
	[adress_id],
	[email_id],
	[password],
	EncryptedPassword,
	[hint_question],
	[hint_answer],
	  [Action],
      [ActionDate])
 select (Next Value For user_audit_seq),d.[user_id],d.first_name,d.last_name,d.[user_name],d.[date_of_birth],d.[gender],d.[contact_number],d.[adress_id],d.[email_id],d.[password],d.[EncryptedPassword],d.[hint_question],d.[hint_answer],'U',GETDATE()
From deleted d   
END
GO

update [User] set first_name = 'Vinitha1234' where first_name='Vinitha'
Select * from [UsersAudit]

select * from [User]





