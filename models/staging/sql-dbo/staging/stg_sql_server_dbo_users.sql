{{
  config(
    materialized='view'
  )
}}

WITH stg_sql_server_dbo_users AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'users') }}
    ),

users AS (
    SELECT
      USER_ID ,
      FIRST_NAME ,
      LAST_NAME ,
      cast(replace(PHONE_NUMBER,'-','')as numeric) as PHONE_NUMBER,
      date(CREATED_AT) as CREATED_AT_utc ,
      date(UPDATED_AT) as UPDATED_AT_utc ,
      ADDRESS_ID ,
      EMAIL ,
      _FIVETRAN_DELETED ,
      _FIVETRAN_SYNCED  
    FROM stg_sql_server_dbo_users
    )

SELECT * FROM users