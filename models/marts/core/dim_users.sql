WITH int_users AS (
    SELECT * 
    FROM {{ ref('int_users') }}
    ),

fact_users AS (
    SELECT
    
        user_id,
        nk_user_id,
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
        dato_usuario_no_valido_desde,
        dato_calle_no_valido_desde

    FROM int_users 

    )

SELECT * FROM fact_users