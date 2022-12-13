WITH stg_sql_server_dbo_events AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'events') }}
    ),

events AS (
    SELECT
        EVENT_ID,
        EVENT_TYPE,
        case 
          when event_type='checkout' or event_type='package_shipped' then null
          ELSE
          product_id
        END AS product_id ,
        case 
          when event_type!='checkout' and event_type!='package_shipped' then null
          ELSE
          ORDER_ID
        END AS ORDER_ID ,       
        SESSION_ID ,
        PAGE_URL ,
        --DATE(CREATED_AT) AS CREATED_AT_utc,
        CREATED_AT AS CREATED_AT_utc,
        USER_ID ,
        _FIVETRAN_DELETED ,
        _FIVETRAN_SYNCED 
    FROM stg_sql_server_dbo_events
)

SELECT * FROM events