--{{config(materialized = 'table', schema = 'transforming_dev')}}
{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}
 
select
ss.orderid,
ss.linenumber,
sh.companyname,
ss.shipmentdate,
ss.status
from
{{ref('shipments_snapshot')}} as ss  left join  {{ref('lkp_shippers')}} as sh
on ss.SHIPPERID = sh.SHIPPERID
where ss.dbt_valid_to is null