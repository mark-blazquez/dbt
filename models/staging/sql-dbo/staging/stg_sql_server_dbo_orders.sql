{{
  config(
    materialized='view'
  )
}}

WITH stg_sql_server_dbo_orders AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'orders') }}
    ),

orders AS (
    SELECT
      ADDRESS_ID ,
      USER_ID ,
      STATUS ,
      ORDER_TOTAL as ORDER_TOTAL_COST_$ ,
      ORDER_COST as ORDER_COST_WITHOUT_SHIPPING_$ ,
      ESTIMATED_DELIVERY_AT as ESTIMATED_DELIVERY_AT_utc,
      TRACKING_ID ,
      SHIPPING_SERVICE ,
      PROMO_ID ,
      SHIPPING_COST as SHIPPING_COST_$ ,
      CREATED_AT as CREATED_AT_utc,
      _FIVETRAN_DELETED ,
      _FIVETRAN_SYNCED 
    FROM stg_sql_server_dbo_orders
    )

SELECT * FROM orders