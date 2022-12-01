   select *
   from {{ source(src_sql_server_dbo) }}
   WHERE date(estimated_delivery_at) > date(created_at) 
   or
   estimated_delivery_at is null ;
