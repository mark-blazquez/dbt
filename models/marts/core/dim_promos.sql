WITH stg_sql_server_dbo_promos AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_promos') }}
    ),

dim_promos AS (
    SELECT
       
    FROM stg_sql_server_dbo_promos
    )

SELECT * FROM dim_promos