

WITH stg_sql_server_dbo_orders AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'orders') }}
    ),

orders AS (
    SELECT

      ORDER_ID,
      ADDRESS_ID ,
      USER_ID ,
      STATUS ,
      ORDER_TOTAL as ORDER_TOTAL_COST_$ ,
      ORDER_COST as ORDER_COST_WITHOUT_SHIPPING_$ ,
      SHIPPING_COST as SHIPPING_COST_$ ,

      date(CREATED_AT) as CREATED_AT_utc,
      DATE(ESTIMATED_DELIVERY_AT) as ESTIMATED_DELIVERY_AT_utc,
      date(DELIVERED_AT) as DELIVERED_AT_utc ,

      /*case 
          when status='preparing' then TRACKING_ID=null
          ELSE TRACKING_ID
      END AS TRACKING_ID ,*/
      TRACKING_ID ,
      
      case 
          when SHIPPING_SERVICE!='ups' and SHIPPING_SERVICE!='usps' and SHIPPING_SERVICE!='fedex'  and SHIPPING_SERVICE!='dhl' then null
          ELSE
          SHIPPING_SERVICE
      END AS SHIPPING_SERVICE ,
      
      case 
        when PROMO_ID!='Mandatory' and PROMO_ID!='Optional' and PROMO_ID!='Digitized' and PROMO_ID!='task-force' and PROMO_ID!='instruction set' and PROMO_ID!='leverage' then null
        ELSE
        PROMO_ID
      END AS PROMO_ID ,
      
      _FIVETRAN_DELETED ,
      _FIVETRAN_SYNCED 
    FROM stg_sql_server_dbo_orders
    )

SELECT * FROM orders