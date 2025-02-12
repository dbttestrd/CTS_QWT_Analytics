--{{config(materialized = 'table', schema = 'transforming_dev')}}
{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}
 
select
get(xmlget($1, 'SupplierID'),'$' ) as SupplierID ,
get(xmlget($1, 'CompanyName'),'$' )::varchar as CompanyName,
get(xmlget($1, 'ContactName'),'$' )::varchar as ContactName,
get(xmlget($1, 'Address'),'$' )::varchar as Address,
get(xmlget($1, 'City'),'$' )::varchar as City,
get(xmlget($1, 'PostalCode'),'$' )::varchar as PostalCode,
get(xmlget($1, 'Country'),'$' )::varchar as Country,
get(xmlget($1, 'Phone'),'$' )::varchar as Phone,
get(xmlget($1, 'Fax'),'$' )::varchar as Fax

from
 {{ref('stg_suppliers')}} 