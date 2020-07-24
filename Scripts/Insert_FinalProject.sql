------------------------Insertion--------------

----Insert Script for Address Table-----
Insert into Address values('21', 7,'1163 Boylston Street','Boston','Ma',02215);
Insert into Address values('2', 8,'1164 Boylston Ave','Boston','Ma',02277);
Insert into Address values('13', 3,'40 Parker Street','Boston','Ma',02120);
Insert into Address values('10', 7,'52 harvard street','Boston','Ma',02115);
Insert into Address values('19', 6,'52 columbia ave','Boston','Ma',02195);
Insert into Address values('27', 2,'52 Quincy street','Boston','Ma',02155);
Insert into Address values('11', 7,'42 ABC street','Boston','Ma',02186);
Insert into Address values('9', 11,'16 Commonwealth street','Boston','Ma',02220);
Insert into Address values('22', 13,'1240 Brighton street','Boston','Ma',01167);
Insert into Address values('6', 4,'1116 Woodridge','Jersey City','NJ',07189);
Insert into Address values('20', 15,'38 East Rutherford','New Jersey','NJ',07185);
Insert into Address values('18', 418,'1 Avalon street','Princy','WV',01116);
Insert into Address values('28', 418,'22 School Street','Virgina','WV',01122);
Insert into Address values('33', 555,'55 Nylon street','Montgomery','AL',01216);
Insert into Address values('39', 678,'67 Alasa Ave','Springfield','IL',01216);
Insert into Address values('40', 123,'11 Mission hill ave','Columbus','OH',03216);

Select * from Address

--insert script into Category---------------
Insert into Category values('01','Clothing','Clothing');
Insert into Category values('02','Shoes','Shoes');
Insert into Category values('03','Accessories','Accessories');
Insert into Category values('04','Belts','Belts');
Insert into Category values('05','gloves','gloves');
Insert into Category values('06','Muffs','Muffs');
Insert into Category values('07','Wallets','Wallets');
Insert into Category values('08','Clutches','Clutches');
Insert into Category values('09','Cameras','Cameras');
Insert into Category values('10','Lights','Lights');
Insert into Category values('11','Kitchen Appliances','Kitchen Appliances');
Insert into Category values('12','Soaps','Soaps');
Insert into Category values('13','Perfumes','Perfumes');

Select * from Category


  --insert script for users-------------
Insert into [User] values((Next Value For user_seq) ,'Priyanka','KPD','Priyankakpd', '8/14/1995','F', 6179599357, 111, 'priyakpd@gmail.com','Priy@14', 'Priy@14', 'What is your First Pet Name','Goldy');
Insert into [User] values((Next Value For user_seq) ,'Lohita','Gundapaneni','lohitaG', '11/14/1997','F', 68907652341, 112, 'lohitG@gmail.com','Priy@14', 'Priy@14', 'What is your First Pet Name','fishy');
Insert into [User] values((Next Value For user_seq) ,'Supriya','Devika','SupriyaD', '3/1/1996','F', 1234567890, 113, 'supriyaD@gmail.com','sup@1', 'sup@1', 'What is your First Nick Name','pet');
Insert into [User] values((Next Value For user_seq) ,'Vinitha','Koppula','VinithaK', '5/20/1998','M', 9865331628, 114, 'viniK@gmail.com','vini@2', 'Vinitha@2', 'What is your Childhood Nick Name','Vini');
Insert into [User] values((Next Value For user_seq) ,'Ruchira','Konda','RuchiraK', '6/21/1997','M', 7382295725, 115, 'ruchiK@gmail.com','ruchi@3', 'Ruchira@1', 'What is your Childhood Nick Name','Ritu');
Insert into [User] values((Next Value For user_seq) ,'Namratha','Vatti','NamrathaK', '4/08/1994','M', 6494783725, 116, 'nammuV@gmail.com','nammu@2', 'Namratha@6', 'What is your Childhood Nick Name','Nammu');
Insert into [User] values((Next Value For user_seq) ,'Neeraja','Kondipati','NeerajaK', '1/03/1971','F', 69742570765, 117, 'nerjk@gmail.com','neerk@1', 'Neerajak@1', 'What is your fav place to visit','Manali');
Insert into [User] values((Next Value For user_seq) ,'Gautami','Sukhavasi','GautamiS', '7/20/1990','F', 7378294789, 118, 'gautS@gmail.com','gaut@2', 'Gautami@26', 'What is your fav place to visit','Paris');
Insert into [User] values((Next Value For user_seq) ,'Vinay','Sukh','VinayS', '11/12/1989','M', 9087542458, 119, 'gvinayS@gmail.com','vins@2', 'vinayS@26', 'What is your fav place to visit','France');
Insert into [User] values((Next Value For user_seq) ,'Deepthi','Kundurthy','deepiS', '7/30/1996','F', 7642456898, 120, 'deepK@gmail.com','deep@5', 'deep@5', 'What is your first pet name','Blanket');
Insert into [User] values((Next Value For user_seq) ,'Keerthi','Kund','KeetsK', '7/19/1967','M', 67393578399, 121, 'keetS@gmail.com','keets@2', 'keet@26', 'What is your fav place to visit','Japan');

ALTER TABLE [User] ADD full_name AS (first_name +' '+last_name);

Select * from [User]

------insert script for brand-----
INSERT INTO Brand(Brand_Id, Brand_Name) 
SELECT '1111' AS Brand_Id, 
      'Puma' AS Brand_Name
INSERT INTO Brand(Brand_Id, Brand_Name) 
SELECT '1112' AS Brand_Id, 
      'Adidas' AS Brand_Name
INSERT INTO Brand(Brand_Id, Brand_Name) 
SELECT '1113' AS Brand_Id, 
      'Nike' AS Brand_Name
INSERT INTO Brand(Brand_Id, Brand_Name) 
SELECT '1114' AS Brand_Id, 
      'UnderArmour' AS Brand_Name
INSERT INTO Brand(Brand_Id, Brand_Name) 
SELECT '1115' AS Brand_Id, 
      'Kevins' AS Brand_Name
INSERT INTO Brand(Brand_Id, Brand_Name) 
SELECT '1116' AS Brand_Id, 
      'Prada' AS Brand_Name
INSERT INTO Brand(Brand_Id, Brand_Name) 
SELECT '1117' AS Brand_Id, 
      'Givency' AS Brand_Name
INSERT INTO Brand(Brand_Id, Brand_Name) 
SELECT '1118' AS Brand_Id, 
      'Guess' AS Brand_Name
INSERT INTO Brand(Brand_Id, Brand_Name) 
SELECT '1119' AS Brand_Id, 
      'CK' AS Brand_Name
INSERT INTO Brand(Brand_Id, Brand_Name) 
SELECT '1120' AS Brand_Id, 
      'Levis' AS Brand_Name

Select * from Brand

-------------Insert script for Supplier------------
Insert into Supplier Values('1234','DK Trading',21,6173456548);
Insert into Supplier Values('5678','FK AND CO',2,6073927638);
Insert into Supplier Values('9012','MINE SILKS',13,987654321);
Insert into Supplier Values('3456','KP Sellers', 10,345629048);
Insert into Supplier Values('6789','MA & Co', 19,8365355267);
Insert into Supplier Values('3112','Hi Trading', 27,345629048);
Insert into Supplier Values('9876','Smile Sellers', 11,345629048);
Insert into Supplier Values('0965','Macys', 19,8473893948);
Insert into Supplier Values('4532','My Leather', 22,345687568);
Insert into Supplier Values('2121','ABCD Sellers', 18,345646638);

Select * from Supplier

-------------Insert script for Product--------------
Insert into Product values(Next Value For product_seq,'Jeans',603,52, 'Mens Awesome light blue jeans from an awesome company', 1234, 1111,01);
Insert into Product values(Next Value For product_seq,'Shirt',604, 67,'Mens  nice white shirt with a black logo, just do it.',5678, 1112, 02);
Insert into Product values(Next Value For product_seq,'Shirt',605, 88,'Womens Light weight Crewneck SweatShirt',9012, 1113, 03);
Insert into Product values(Next Value For product_seq,'HandBag',606, 23,'Womens Maya Leather Satchel Handbag',3456, 1114, 04);
Insert into Product values(Next Value For product_seq,'Wallets',607, 100,'Womens Pink Leather Satchel Handbag',4532, 1115, 05);
Insert into Product values(Next Value For product_seq,'Jeans',608,150,'Mens relaxed Fit Jeans',0965,1116,06);
Insert into Product values(Next Value For product_seq,'Sweater',609,90,'Mens gray sweater that will keep you warm and stylish',2121, 1117, 07);
Insert into Product values(Next Value For product_seq,'Shoes',610,20,'Gray ultraboost that are good for running and style Unisex Shoes',9876,1118,09);
Insert into Product values(Next Value For product_seq,'Gloves',611,10,'Good gloves to prevent Coronavirus',9012,1119,10);
Insert into Product values(Next Value For product_seq,'Muffs',612,99,'Gray woolen muffs',3456,1120,11);

Select * from Product

---------Insert script for order------------
Insert into [Order] values(11,'13','7-25-2019',140,14,252,21,21,'Delivered','7-26-2019');
Insert into [Order] values(12,'14','4-1-2020',162,28,116,10,13,'shipped', '4-02-2019');
Insert into [Order] values(13,'15','04-02-2020',199,50,29,2,10,'Delivered','04-03-2020');
Insert into [Order] values(14,'15','04-02-2020',199,50,29,2,10,'Delivered','04-05-2020');
Insert into [Order] values(15,'15','04-02-2020',199,50,29,2,10,'Delivered','04-05-2020');
Insert into [Order] values(16,'15','04-03-2020',199,50,29,2,10,'Delivered','04-05-2020');
Insert into [Order] values(17,'14','04-03-2020',199,50,29,2,10,'Delivered','04-05-2020');
Insert into [Order] values(18,'14','04-03-2020',199,50,29,2,10,'Delivered','04-05-2020');
Insert into [Order] values(19,'14','04-04-2020',199,50,29,2,10,'Delivered','04-06-2020');
Insert into [Order] values(20,'13','04-04-2020',199,50,29,2,10,'shipped','04-06-2020');
Insert into [Order] values(21,'14','04-06-2020',199,50,29,2,10,'shipped','04-07-2020');
Insert into [Order] values(22,'14','04-06-2020',199,50,29,2,10,'shipped','04-07-2020');




Select * from [Order]

-------------Insert script for OrderLine---------
Insert into OrderLine values(11,10,70.50,2,5);
Insert into OrderLine values(12,11,160.10,1,25);
Insert into OrderLine values(13,13,10.50,4,10);
Insert into OrderLine values(14,13,10.50,4,10);
Insert into OrderLine values(15,10,23,1,9);
Insert into OrderLine values(16,10,24,2,8);
Insert into OrderLine values(17,10,25,2,12);
Insert into OrderLine values(18,10,44,2,8);
Insert into OrderLine values(19,10,34,2,13);
Insert into OrderLine values(20,11,60.10,1,25);
Insert into OrderLine values(21,11,16.10,1,40);
Insert into OrderLine values(22,12,23.67,3,30);

Select * from OrderLine
