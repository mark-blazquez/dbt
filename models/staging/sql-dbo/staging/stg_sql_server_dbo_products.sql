{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'products') }}
    ),

events AS (
    SELECT
        PRODUCT_ID ,
        PRICE ,
        NAME ,
        INVENTORY ,
        _FIVETRAN_DELETED ,
        _FIVETRAN_SYNCED 
    FROM sql_server_dbo
    )

SELECT * FROM 