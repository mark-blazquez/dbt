WITH stg_sql_server_dbo_promos AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_promos') }}
    ),

dim_promos AS (
    SELECT
        md5(PROMO_ID) as promo_id,
        PROMO_ID as nk_promo_id,
        DISCOUNT_$,
        STATUS
    FROM stg_sql_server_dbo_promos
    )

SELECT * FROM dim_promos