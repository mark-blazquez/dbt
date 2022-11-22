{{
  config(
    materialized='view'
  )
}}

WITH stg_sql_server_dbo_addresses AS (
    SELECT * 
    FROM {{ source('sql_server_dbo','addresses') }}
    ),

addresses AS (
    SELECT
      ADDRESS_ID,
      ADDRESS as number_address_street_name,
      ZIPCODE ,
      COUNTRY ,
      STATE ,
      _FIVETRAN_DELETED ,
      _FIVETRAN_SYNCED
    FROM stg_sql_server_dbo_addresses
    where ZIPCODE <100000 and ZIPCODE <= 10000
    )

SELECT * FROM addresses