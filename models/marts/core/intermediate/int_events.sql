WITH stg_sql_server_dbo_events AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_events') }}
    ),

int_events AS (
    SELECT

        md5(EVENT_ID) as EVENT_ID,
        EVENT_ID as nk_event_id,
        EVENT_TYPE,
        md5(product_id) as product_id,
        md5(ORDER_ID) as ORDER_ID,       
        SESSION_ID ,
        PAGE_URL ,
        CREATED_AT_utc,
        md5(USER_ID) as USER_ID
    from stg_sql_server_dbo_events

    )

SELECT * FROM int_events