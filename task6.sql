SELECT * FROM shopping;
 
select count(distinct(invoice_date)) as unique_dates from shopping;
select distinct(year(invoice_date)) as distinct_year from shopping;

SELECT invoice_date, count(*) AS total_orders
from shopping group by  invoice_date order by invoice_date;

SELECT DATE_FORMAT(invoice_date, '%Y-%m') as month, count(*) AS total_orders
from shopping group by month order by month;

select year(invoice_date) as year,count(*) as total_orders from shopping group by year order by year;

select min(invoice_date) as first_order_date, max(invoice_date) as last_order_date from shopping;

select dayname(invoice_date) AS day_of_week, count(*) as total_orders
from shopping group by day_of_week;

SELECT monthname(invoice_date) AS month_name, count(*) AS total_orders from shopping group by month_name;

SELECT month, orders, orders - LAG(orders) over(order by month) AS growth
from  (select DATE_FORMAT(invoice_date, '%Y-%m') as  month, count(*) AS orders
from shopping group by month) t;

select year(invoice_date) as year,round(sum(price * quantity),2) as total_revenue
from shopping group by  year;

select year(invoice_date) as year, month(invoice_date) as month, round(sum(price * quantity),2) as total_revenue
from shopping group by  year, month order by year,month;

select dayname(invoice_date) as day_name, round(sum(price * quantity),2)as total_revenue
from shopping group by  day_name order by total_revenue;

select (
    (select sum(price * quantity) from shopping where year(invoice_date) = 2022) -
    (select sum(price * quantity) from shopping where year(invoice_date) = 2021)
) as revenue_difference;

select case when month(invoice_date) in (12,1,2) then 'Winter'
when month(invoice_date) in (3,4,5) then 'Spring'
when month(invoice_date) in (6,7,8) then 'Summer'
else 'Autumn' end as season,
round(sum(price * quantity),2) as total_revenue
from shopping group by  season;

select year(invoice_date) as year,payment_method,round(sum(quantity*price),2) as revenue from shopping
group by year,payment_method order by year;

select month(invoice_date) as month,payment_method,round(sum(quantity*price),2) as revenue from shopping
where year(Invoice_date)=2021
group by month,payment_method order by month;

select year(invoice_date) as year,category,round(sum(quantity*price),2) as revenue from shopping
group by year,category order by year;

select month(invoice_date) as year,category,count(*) as orders from shopping
where year(invoice_date)=2022 
group by year,category order by year;

select year(invoice_date) as year,gender,count(*)as cnt,round(sum(quantity*price),2) as revenue from shopping
group by year,gender order by year;

select year(invoice_date) as year,month(invoice_date) as month,gender,count(*)as cnt,round(sum(quantity*price),2) as revenue from shopping
group by year,month,gender order by year;

select year(invoice_date) as year,shopping_mall,round(sum(quantity*price),2) as revenue from shopping
group by year,shopping_mall order by year;

select monthname(invoice_date) as month,shopping_mall,round(sum(quantity*price),2) as revenue from shopping
where year(invoice_date)=2021 group by month,shopping_mall order by month;

select shopping_mall,sum(quantity) as orders,round(sum(quantity*price),2) as revenue from shopping
group by shopping_mall order by orders;

select payment_method,sum(quantity) as orders,round(sum(quantity*price),2) as revenue from shopping
group by payment_method order by orders;

select category,sum(quantity) as orders,round(sum(quantity*price),2) as revenue from shopping
group by category order by orders;

select gender,sum(quantity) as orders,round(sum(quantity*price),2) as revenue from shopping
group by gender order by orders;

select category,gender,sum(quantity) as orders,round(sum(quantity*price),2) as revenue from shopping
group by category,gender order by category;

select shopping_mall,gender,sum(quantity) as orders,round(sum(quantity*price),2) as revenue from shopping
group by shopping_mall,gender order by shopping_mall;

select quantity,count(*) as order_cnt,round(sum(price),2) as revenue  from shopping group by quantity
order by quantity;

select 
round(sum(case when age between 18 and 30 then quantity end),2) as `18-30`,
round(sum(case when age between 31 and 40 then quantity end),2) as `31-40` ,
round(sum(case when age between 41 and 50 then quantity end),2) as `41-50`,
round(sum(case when age>50 then quantity end),2)as `age>50`
from shopping
union all
select 
round(sum(case when age between 18 and 30 then price*quantity end),2) as `18-30`,
round(sum(case when age between 31 and 40 then price*quantity end),2) as `31-40` ,
round(sum(case when age between 41 and 50 then price*quantity end),2) as `41-50`,
round(sum(case when age>50 then price*quantity end),2)as `age>50`
from shopping;

select year(invoice_date) as year,sum(quantity) as total_orders from shopping
group by year order by year;

select monthname(invoice_date) as month,sum(quantity) as total_orders,round(sum(price*quantity),2) as revenue from shopping
group by month(invoice_date), monthname(invoice_date) order by month(invoice_date);

select monthname(invoice_date) as month,sum(quantity) as total_orders,round(sum(price*quantity),2) as revenue from shopping
 where year(invoice_date)=2021 group by month(invoice_date), monthname(invoice_date) order by month(invoice_date);

select monthname(invoice_date) as month,sum(quantity) as total_orders,round(sum(price*quantity),2) as revenue from shopping
 where year(invoice_date)=2022 group by month(invoice_date), monthname(invoice_date) order by month(invoice_date);

select monthname(invoice_date) as month,sum(quantity) as total_orders,round(sum(price*quantity),2) as revenue from shopping
 where year(invoice_date)=2023 group by month(invoice_date), monthname(invoice_date) order by month(invoice_date);

select year(invoice_date) as year,month(invoice_date) as month,sum(quantity) as total_orders from shopping
group by year,month order by year,month;


SELECT * FROM shopping;
