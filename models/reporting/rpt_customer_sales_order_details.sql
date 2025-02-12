{{config(materialized = 'view', schema = 'reporting_dev')}}

select 
companyname,
contactname,
 min(orderdate) first_order_date,
 min(DAY_OF_WEEK_NAME) first_order_day ,
 max(orderdate) last_order_date,
 max(DAY_OF_WEEK_NAME) last_order_day,
 sum(quantity) totalquantity ,
 sum(f.linesalesamount) totalsales
from {{ref("dm_customers")}} c left outer join  {{ref("fct_orders")}} f
on f.customerid = c.customerid 
left outer join {{ref("dm_date")}} d on f.orderdate = d.date_day
group by companyname, contactname 
order by totalsales desc


