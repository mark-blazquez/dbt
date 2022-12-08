WITH stg_sql_server_dbo_products AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_products') }}
    ),

dim_products AS (
    SELECT
        md5(PRODUCT_ID) as PRODUCT_ID,
        PRODUCT_ID as nk_product_id,
        PRICE,
        NAME,
        INVENTORY,
        dato_no_valido_desde
    FROM stg_sql_server_dbo_products
    )

SELECT * FROM dim_products