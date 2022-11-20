{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'promos') }}
    ),

events AS (
    SELECT
      PROMO_ID ,
      DISCOUNT ,
      STATUS ),
      _FIVETRAN_DELETED ,
      _FIVETRAN_SYNCED 
    FROM sql_server_dbo
    )

SELECT * FROM 