{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'orders') }}
    ),

events AS (
    SELECT
      ADDRESS_ID ,
      USER_ID ,
      STATUS ,
      ORDER_TOTAL ,
      ORDER_COST ,
      ESTIMATED_DELIVERY_AT ,
      TRACKING_ID ,
      SHIPPING_SERVICE ,
      PROMO_ID ,
      SHIPPING_COST ,
      DELIVERED_AT ,
      CREATED_AT ,
      _FIVETRAN_DELETED ,
      _FIVETRAN_SYNCED 
    FROM sql_server_dbo
    )

SELECT * FROM 