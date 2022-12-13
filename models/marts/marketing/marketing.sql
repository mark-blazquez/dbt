WITH dim_users AS (
    SELECT * 
    FROM {{ ref('dim_users') }}
    ),
fact_orders AS (
    SELECT * 
    FROM {{ ref('fact_orders') }}
    ),
datamart_marketing AS (
    SELECT
        fact_orders.user_id,
        first_name,
        last_name,
        email,
        phone_number,
        dim_users.CREATED_AT_UTC,
        updated_at_utc,
        address_number,
        address_name,
        zipcode,
        state,
        country,
        count(distinct(order_id)) as total_number_orders,
        sum(distinct(ORDER_TOTAL_COST_$)) as total_order_cost_usd,
        sum(distinct(SHIPPING_COST_$)) as total_shipping_cost_usd,
        (sum(distinct(ORDER_COST_WITHOUT_SHIPPING_$)) 
        +sum(distinct(SHIPPING_COST_$)))
        -sum(distinct(ORDER_TOTAL_COST_$))
        as total_discount_usd,
        sum(QUANTITY_PRODUCT_IN_ORDER) as total_quantity_product,
        --count(distinct(order_id))total_diferent_product

    FROM fact_orders join dim_users on fact_orders.user_id=dim_users.user_id

    group by 
        fact_orders.user_id,
        first_name,
        last_name,
        email,
        phone_number,
        dim_users.CREATED_AT_UTC,
        updated_at_utc,
        address_number,
        address_name,
        zipcode,
        state,
        country

    order by first_name

    )

SELECT * FROM datamart_marketing