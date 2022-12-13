WITH dim_products AS (
    SELECT * 
    FROM {{ ref('dim_products') }}
    ),
fact_orders AS (
    SELECT * 
    FROM {{ ref('fact_orders') }}
    ),
datamart_venta_mes_producto AS (
    SELECT
        name,
        sum(QUANTITY_PRODUCT_IN_ORDER*price) as venta_mes,
        concat(month(CREATED_AT_UTC),'-',year(CREATED_AT_UTC)) as mes,
        year(CREATED_AT_UTC)*10000+month(CREATED_AT_UTC)*100 as id_anio_mes

    FROM fact_orders join dim_products on fact_orders.product_id=dim_products.product_id
    group by name,mes,id_anio_mes
    order by name
 


    )

SELECT * FROM datamart_venta_mes_producto