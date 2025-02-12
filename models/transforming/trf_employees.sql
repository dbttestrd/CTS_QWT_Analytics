--{{config(materialized = 'table', schema = 'transforming_dev')}}
{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}
 
select
 
emp.empid,
emp.firstname,
emp.lastname,
emp.title,
emp.hiredate,
IFF(emp.extension = '-', 'NA', emp.extension) as extension,
emp.yearsalary,
IFF(mgr.firstname is null, emp.firstname, mgr.firstname) as managername,
IFF(mgr.title is null, emp.title, mgr.title) as managertitle,
ofc.address,
ofc.city,
ofc.country
 
from
 
{{ref('stg_employees')}} as emp left join

{{ref('stg_employees')}} as mgr on emp.reportsto = mgr.empid
 
left join {{ref('stg_offices')}} as ofc on emp.office = ofc.officeid
 