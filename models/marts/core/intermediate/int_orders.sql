WITH stg_sql_server_dbo_orders AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_orders') }}
    ),
    stg_sql_server_dbo_order_items AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_order_items') }}
    ),

int_orders AS (
    SELECT

        md5(stg_sql_server_dbo_orders.order_id) as order_id,
        stg_sql_server_dbo_orders.order_id as nk_order_id,
        md5(USER_ID) as user_id,
        STATUS,
        ORDER_TOTAL_COST_$,
        ORDER_COST_WITHOUT_SHIPPING_$,
        SHIPPING_COST_$,
        md5(PRODUCT_ID) as PRODUCT_ID,
        QUANTITY as quantity_product_in_order,
        year(CREATED_AT_UTC)*10000+month(CREATED_AT_UTC)*100+day(CREATED_AT_UTC) as id_date,
        CREATED_AT_UTC,
        ESTIMATED_DELIVERY_AT_UTC,
        DELIVERED_AT_UTC,
        SHIPPING_SERVICE,
        md5(PROMO_ID) as promo_id
    FROM stg_sql_server_dbo_orders join stg_sql_server_dbo_order_items 
    on stg_sql_server_dbo_orders.order_id=stg_sql_server_dbo_order_items.order_id
    --order by stg_sql_server_dbo_orders.order_id
    )

SELECT * FROM int_orders