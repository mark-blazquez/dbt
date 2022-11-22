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
      LAST_NAME ,
      UPDATED_AT as UPDATED_AT_utc ,
      PHONE_NUMBER /*TRANSFORMAR */ ,
      FIRST_NAME ,
      CREATED_AT ,
      ADDRESS_ID ,
      EMAIL/*HACERLO COMO TEST*/ ,
      _FIVETRAN_DELETED ,
      _FIVETRAN_SYNCED  
    FROM stg_sql_server_dbo_users
    )

SELECT * FROM users