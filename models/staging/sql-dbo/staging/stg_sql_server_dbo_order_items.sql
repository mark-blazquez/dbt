{{
  config(
    materialized='view'
  )
}}

WITH stg_sql_server_dbo_order_items AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'order_items') }}
    ),

order_items AS (
    SELECT
        ORDER_ID ,
        PRODUCT_ID ,
        QUANTITY ,
        _FIVETRAN_DELETED ,
        _FIVETRAN_SYNCED 
    FROM stg_sql_server_dbo_order_items
    )

SELECT * FROM order_items