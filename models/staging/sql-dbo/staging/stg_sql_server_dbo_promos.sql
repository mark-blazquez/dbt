

WITH stg_sql_server_dbo_promos AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'promos') }}
    ),

promos AS (
    SELECT
      PROMO_ID ,
      DISCOUNT as discount_$ ,
      case 
        when STATUS='active' then true
        else false
      end as status ,
      _FIVETRAN_DELETED ,
      _FIVETRAN_SYNCED 
    FROM stg_sql_server_dbo_promos
    )

SELECT * FROM promos