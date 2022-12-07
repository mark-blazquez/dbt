WITH int_budgets AS (
    SELECT * 
    FROM {{ ref('int_budgets') }}
    ),

fact_budgets AS (
    SELECT
        id_budget,
        nk_id_budget,
        product_id,
        quantity,
        year(order_date)*10000+month(order_date)*100 as id_anio_mes,
        order_date
    FROM int_budgets 

    )

SELECT * FROM fact_budgets