WITH int_orders AS (
    SELECT * 
    FROM {{ ref('int_orders') }}
    ),

fact_orders AS (
    SELECT
        order_id,
        nk_order_id,
        user_id,
        STATUS,
        ORDER_TOTAL_COST_$,
        ORDER_COST_WITHOUT_SHIPPING_$,
        SHIPPING_COST_$,
        PRODUCT_ID,
        quantity_product_in_order,
        year(CREATED_AT_UTC)*10000+month(CREATED_AT_UTC)*100+day(CREATED_AT_UTC) as id_date,
        CREATED_AT_UTC,
        ESTIMATED_DELIVERY_AT_UTC,
        DELIVERED_AT_UTC,
        SHIPPING_SERVICE,
        promo_id,
        dato_no_valido_desde


    FROM int_orders 

    )

SELECT * FROM fact_orders