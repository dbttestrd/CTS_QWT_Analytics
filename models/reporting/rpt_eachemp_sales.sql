{{config(materialized = 'view', schema = 'reporting_dev')}}

select
--concat(e.firstname,e.lastname) as empname,
empname,
count(c.customerid) customerid,
count(p.productid) productid,
sum(f.linesalesamount) linesalesamount
from {{ref("fct_orders")}} f left outer join {{ref("dm_customers")}} c on f.customerid = c.customerid
left outer join {{ref("dm_employees")}} e on f.employeeid = e.empid
left outer join {{ref("dm_products")}} p on f.productid = p.productid
group by empname-- concat(e.firstname,e.lastname)
order by sum(f.linesalesamount) desc