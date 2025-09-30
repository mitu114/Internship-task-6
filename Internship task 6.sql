#1. What is the monthly revenue of the company ?

select round(sum(Quantity*UnitPrice),2) as Total_Revenue
from online_sales;

#5. Find the number of items sold in each category of products?

select Description as items,count(InvoiceNo)
from online_sales
group by Description;

#2. What is the total number of items sold?

select sum(Quantity) as total_items_sold
from online_sales;

#3. Identify the number of payments made from all payment methods ?

select PaymentMethod,count(InvoiceNo) as Payments_made
from online_sales
group by PaymentMethod
order by total_orders;

#4. Group the number of items as returned vs not returned ?

select ReturnStatus,count(InvoiceNo) as total_items
from online_sales
group by ReturnStatus;

#5. Identify top 5 most sold items ?

select Description as Items,count(InvoiceNo) as count_items
from online_sales
group by Description
order by count_items desc
limit 5;

#6. What are the monthly revenues of the company ?

select extract(month from InvoiceDate) as month_number,round(sum(Quantity*UnitPrice),2) as Monthly_revenue
from online_sales
group by month_number;


#7. Identify top 5 countries with highest number of items sold ?

select country,sum(Quantity) as items_sold
from online_sales
group by country
order by items_sold desc
limit 5;

#8. Identify bottom 3 months with lowest revenue ?

select extract(month from InvoiceDate) as month_number,round(sum(Quantity*UnitPrice),2) as Monthly_revenue
from online_sales
group by month_number
order by Monthly_revenue
limit 3;

#9. Identify the number of different types of products sold ?

select count(distinct StockCode) as Types_of_products
from online_sales;

#10. Identify top 5 categories with highest revenue ?

select Category,round(sum((Quantity)*UnitPrice),2) as Revenue
from online_sales
group by Category
order by Revenue desc; 

#11. Identify different types of items sold by different SalesChannel ?

select SalesChannel,sum(Quantity) as count_items
from online_sales
group by SalesChannel;


#12. Identify the Shipment provider with highest and lowest number of items sold ?
#Highest

select ShipmentProvider,sum(Quantity) as items_sold
from online_sales
group by ShipmentProvider
order by items_sold desc
limit 1;

#Lowest

select ShipmentProvider,sum(Quantity) as items_sold
from online_sales
group by ShipmentProvider
order by items_sold
limit 1;

#13. Group items by their order priority from highest to lowest?

select OrderPriority,count(InvoiceNo) as orders
from online_sales
group by OrderPriority
order by orders desc;
