WITH int_orders AS (
    SELECT * 
    FROM {{ ref('int_orders') }}
    ),
    dim_fecha AS (
    SELECT * 
    FROM {{ ref('dim_fecha_dia') }}
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
        CREATED_AT_UTC,
        ESTIMATED_DELIVERY_AT_UTC,
        DELIVERED_AT_UTC,
        SHIPPING_SERVICE,
        promo_id

    FROM int_orders join dim_fecha_dia 
    on int_orders.CREATED_AT_UTC=dim_fecha_dia.id_date
    )

SELECT * FROM int_orders