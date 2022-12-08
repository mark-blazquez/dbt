WITH int_events AS (
    SELECT * 
    FROM {{ ref('int_events') }}
    ),

fact_events AS (
    SELECT
        EVENT_ID,
        nk_event_id,
        EVENT_TYPE,
        product_id,
        ORDER_ID,       
        SESSION_ID ,
        PAGE_URL ,
        year(CREATED_AT_UTC)*10000+month(CREATED_AT_UTC)*100+day(CREATED_AT_UTC) as id_date,
        CREATED_AT_utc,
        md5(USER_ID) as USER_ID
        
    FROM int_events 

    )

SELECT * FROM fact_events
