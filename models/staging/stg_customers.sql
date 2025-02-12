{{config(materialized = 'table', pre_hook ="use warehouse loading_wh;",
post_hook='grant select on table DB_QWT_ANALYTICS_DEV.SCHEMA_DEV.STG_CUSTOMERS to role public;'
 )}}
select * from {{source('raw_qwt','raw_customers')}}