{{
  config(
    materialized='view'
  )
}}

WITH stg_sql_server_dbo_events AS (
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
    FROM stg_sql_server_dbo_events
    )

SELECT * FROM 