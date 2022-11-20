{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'users') }}
    ),

events AS (
    SELECT
      USER_ID  NOT NULL,
      LAST_NAME ,
      UPDATED_AT ,
      PHONE_NUMBER ,
      TOTAL_ORDERS ,
      FIRST_NAME ,
      CREATED_AT ,
      ADDRESS_ID ,
      EMAIL ,
      _FIVETRAN_DELETED ,
      _FIVETRAN_SYNCED  
    FROM sql_server_dbo
    )

SELECT * FROM 