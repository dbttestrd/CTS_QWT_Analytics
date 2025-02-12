{{config(materialized = 'table')}}

select ORDERID ,
	LINENUMBER ,
	SHIPPERID ,
	CUSTOMERID ,
	PRODUCTID ,
	EMPLOYEEID ,
---	trim(shipmentdate,'0:00')::date  SHIPMENTDATE1,
    TO_DATE(replace(SHIPMENTDATE,'0:00','')) SHIPMENTDATE,
	STATUS
from {{source('raw_qwt','raw_shipments')}}