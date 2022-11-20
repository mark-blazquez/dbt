{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'events') }}
    ),

events AS (
    SELECT
        EVENT_TYPE,
        PRODUCT_ID ,
        ORDER_ID ,
        SESSION_ID ,
        PAGE_URL ,
        CREATED_AT ,
        USER_ID ,
        _FIVETRAN_DELETED ,
        _FIVETRAN_SYNCED ,
    FROM sql_server_dbo
    )

SELECT * FROM 