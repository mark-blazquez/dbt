WITH stg_sql_server_dbo_users AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_users') }}
    ),
stg_sql_server_dbo_addresses AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_addresses') }}--pilla el dato desde silver que este a su vez lo pilla del snapshot y al ser una vista siempre esta actualizado
    ),


int_users AS (
    SELECT

        md5(USER_ID) as user_id,
        USER_ID as nk_user_id,
        FIRST_NAME,
        LAST_NAME,
        PHONE_NUMBER,
        CREATED_AT_UTC,
        UPDATED_AT_UTC,
        EMAIL,
        address_number,
        address_name ,
        ZIPCODE,
        COUNTRY,
        STATE,
        date(DBT_VALID_TO) as dato_no_valido_desde

    from stg_sql_server_dbo_users join stg_sql_server_dbo_addresses 
    on stg_sql_server_dbo_users.address_id=stg_sql_server_dbo_addresses.address_id

    )

SELECT * FROM int_users