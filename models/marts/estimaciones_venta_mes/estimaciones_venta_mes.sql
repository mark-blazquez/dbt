WITH dim_products AS (
    SELECT * 
    FROM {{ ref('dim_products') }}
    ),
fact_budgets AS (
    SELECT * 
    FROM {{ ref('fact_budgets') }}
    ),
datamart_estimaciones AS (
    SELECT
        name,
        sum(quantity*price) as estimacion_venta_$,
        concat(month(order_date),'-',year(order_date)) as mes,
        id_anio_mes
       

    FROM fact_budgets join dim_products on fact_budgets.product_id=dim_products.product_id
    group by name,mes,id_anio_mes
    order by name
    )

SELECT * FROM datamart_estimaciones