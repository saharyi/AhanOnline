create database AhanOnline

use AhanOnline

create table Sale(SalesID nvarchar(10) primary key,OrderID nvarchar(10),Customer nvarchar(20),Product nvarchar(20),Date int,Quantity int,UnitPrice int)
create table  Sale_Profit(Product primary key, ProfitRatio int)
alter table Sale_Profit alter column ProfitRatio float

--1-      کل فروش شرکت چه مقدار است

select sum(Quantity*UnitPrice) as Total_Sale from Sale

--2-      تعداد متمایز مشتریانی که از این شرکت خرید داشته اند، چند تاست؟

select distinct(customer) from Sale

--3-      این شرکت از هر محصول چه مقدار فروخته است؟(متوجه نشدم منظورتون از تعداد فاکتور چی هست!به ازای هر خرید یک فاکتور نداریم؟اگر اینگونه باشد تعداد فاکتور با تعداد آیتم خریداری شده برابر هست

select Product , sum(Quantity) from Sale group by (Product)

--سوال 4
select Customer , sum(Quantity*UnitPrice) as Purchase_amount,count(Quantity) as Invoice_number, sum(Quantity) as Number_Of_Purchased_item from Sale  group by (Customer) having sum(Quantity*UnitPrice)>1500

--سوال 5
select sum(Quantity*UnitPrice*(ProfitRatio/100)) as amount_of_profit ,(((sum(Quantity*UnitPrice*(ProfitRatio/100)))*100)/(sum(Quantity*UnitPrice))) as precentage_of_total_profit from Sale inner join Sale_Profit on Sale.Product=Sale_Profit.Product 

--سوال6
select COUNT(distinct(customer)) from Sale

---سوال ب رو نتوستم حل کنم!

create table employee(id nvarchar(10) primary key ,name nvarchar(100),manager nvarchar(100),Manager_Id nvarchar(10) foreign key references employee(id))

