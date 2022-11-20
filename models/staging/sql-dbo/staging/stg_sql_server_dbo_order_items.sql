{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
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
    FROM sql_server_dbo
    )

SELECT * FROM 