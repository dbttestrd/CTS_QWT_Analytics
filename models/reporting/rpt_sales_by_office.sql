{{config(materialized = 'view', schema = 'reporting_dev')}}

select e.country,
c.companyname,
c.contactname,
count(orderid) total_orders,
SUM(QUANTITY) total_qty ,
 SUM(LINESALESAMOUNT) total_sales ,
 AVG(margin) avg_margin
from  {{ref('dm_customers')}} c inner join {{ref('fct_orders')}}  o
on c.customerid =o.customerid
inner join {{ref('dm_employees')}} e on e.empid=o.employeeid
where e.country = '{{var('v_country', 'France') }}'
group by e.country,c.companyname,c.contactname