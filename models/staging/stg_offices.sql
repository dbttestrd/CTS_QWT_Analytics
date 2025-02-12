
{{config(materialized = 'table')}}
 
select 
Office as officeid ,
OfficeAddress address,
OfficePostalCode postalcode,
OfficeCity city,
OfficeStateProvince stateprovince,
OfficePhone phone,
OfficeFax fax,
OfficeCountry country
from {{source('raw_qwt','raw_offices')}}