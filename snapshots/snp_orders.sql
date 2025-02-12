{% snapshot shipments_snapshot %}
 
{{
 
    config
    (
        target_database = 'DB_QWT_ANALYTICS_DEV',
        target_schema = 'SNAPSHOTS_DEV',
        unique_key="orderid||'-'||linenumber",
        strategy = 'timestamp',
        updated_at = 'shipmentdate'
 
    )        
 
}}
 
select * from {{ref('stg_shipments')}}
{% endsnapshot %}