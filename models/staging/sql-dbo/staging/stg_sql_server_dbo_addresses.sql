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
      cast (substr(address,charindex(' ', address, 1))as varchar(256)) as address_name ,
      cast (left (address,charindex(' ', address, 1))as numeric ) as address_number,
      ZIPCODE ,
      COUNTRY ,
      STATE ,
      _FIVETRAN_DELETED ,
      _FIVETRAN_SYNCED
    FROM stg_sql_server_dbo_addresses
    )


SELECT * FROM addresses