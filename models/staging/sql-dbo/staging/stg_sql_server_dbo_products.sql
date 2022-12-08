

WITH stg_sql_server_dbo_products AS (
    SELECT * 
    FROM {{ ref('products_snapshot') }}
    ),

products AS (
    SELECT
        PRODUCT_ID ,
        PRICE  ,
        NAME ,
        INVENTORY ,
        _FIVETRAN_DELETED ,
        _FIVETRAN_SYNCED ,
        date(DBT_VALID_TO) as dato_no_valido_desde


    FROM stg_sql_server_dbo_products
    )

SELECT * FROM products