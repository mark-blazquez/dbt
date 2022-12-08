
WITH stg_sql_server_dbo_users AS (
    SELECT * 
    FROM {{ ref('users_snapshot') }}
    ),

users AS (
    SELECT
      USER_ID ,
      FIRST_NAME ,
      LAST_NAME ,
      cast(replace(PHONE_NUMBER,'-','')as numeric) as PHONE_NUMBER,
      cast (date(CREATED_AT)as date) as CREATED_AT_utc ,
      cast(date(UPDATED_AT)as date) as UPDATED_AT_utc ,
      ADDRESS_ID ,
      EMAIL ,
      _FIVETRAN_DELETED ,
      _FIVETRAN_SYNCED,
      date(DBT_VALID_TO) as dato_no_valido_desde


    FROM stg_sql_server_dbo_users
    )

SELECT * FROM users