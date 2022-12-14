WITH dim_users AS (
    SELECT * 
    FROM {{ ref('dim_users') }}
    ),
fact_events AS (
    SELECT * 
    FROM {{ ref('fact_events') }}
    ),
datamart_producto AS (
    SELECT

        session_id,
        fact_events.user_id,
        first_name,
        email,
        min(fact_events.CREATED_AT_UTC) as first_event_time_utc,
        max(fact_events.CREATED_AT_UTC) as last_event_time_utc,
        DATEDIFF (minute,  min(fact_events.CREATED_AT_UTC) , max(fact_events.CREATED_AT_UTC) ) as session_lenght_minutes,
        CASE
            WHEN event_type='page_view' THEN count(event_type='page_view')
        END as page_view  ,
        CASE
            WHEN event_type='add_to_cart' THEN count(event_type='add_to_cart')
        END as add_to_cart   ,   
        CASE
            WHEN event_type='checkout' THEN count(event_type='checkout')
        END as checkout  ,    
        CASE
            WHEN event_type='package_shipped' THEN count(event_type='package_shipped')
        END as package_shipped     

    FROM fact_events join dim_users on fact_events.user_id=dim_users.user_id
    group by 
        session_id,
        event_type,
        fact_events.user_id,
        first_name,
        email
    order by first_name


    )

SELECT * FROM datamart_producto