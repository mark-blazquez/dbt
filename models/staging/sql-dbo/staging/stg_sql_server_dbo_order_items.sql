{{
  config(
    materialized='view'
  )
}}

WITH stg_sql_server_dbo_order_item AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'order_items') }}
    ),

events AS (
    SELECT
        ORDER_ID L,
        PRODUCT_ID L,
        QUANTITY ,
        _FIVETRAN_DELETED ,
        _FIVETRAN_SYNCED 
    FROM stg_sql_server_dbo_order_item
    )

SELECT * FROM 