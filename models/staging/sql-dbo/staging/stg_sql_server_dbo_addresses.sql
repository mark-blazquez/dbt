{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'addresses') }}
    ),

events AS (
    SELECT
      ADDRESS ,
      ZIPCODE ,
      COUNTRY ,
      STATE ,
      _FIVETRAN_DELETED,
      _FIVETRAN_SYNCED
    FROM sql_server_dbo
    )

SELECT * FROM 