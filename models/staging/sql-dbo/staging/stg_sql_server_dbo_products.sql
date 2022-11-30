{{
  config(
    materialized='view'
  )
}}

WITH stg_sql_server_dbo_products AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'products') }}
    ),

products AS (
    SELECT
        PRODUCT_ID ,
        PRICE  ,
        NAME ,
        INVENTORY ,
        _FIVETRAN_DELETED ,
        _FIVETRAN_SYNCED 
    FROM stg_sql_server_dbo_products
    )

SELECT * FROM products