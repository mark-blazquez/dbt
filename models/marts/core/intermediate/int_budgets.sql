WITH stg_google_sheets AS (
    SELECT * 
    FROM {{ ref('stg_google_sheets') }}
    ),

int_budgets AS (
    SELECT
        md5(id_budget) as id_budget,
        id_budget as nk_id_budget,
        md5(product_id) as product_id,
        quantity,
        /*concat(month(order_date),'-',year(order_date)) as*/ order_date
    FROM stg_google_sheets 

    )

SELECT * FROM int_budgets