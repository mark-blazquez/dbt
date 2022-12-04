WITH stg_sql_server_dbo_users AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_users') }}
    ),

dim_users AS (
    SELECT
        (USER_ID) as user_id,
        user_id as nk_user_id
        , first_name
        , last_name
        , email
        , phone_number
        , created_at_utc
        , updated_at_utc
        , address_id
        , date_load
    FROM stg_sql_server_dbo_users
    )

SELECT * FROM dim_users