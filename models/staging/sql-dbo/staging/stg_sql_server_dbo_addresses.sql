
WITH stg_sql_server_dbo_addresses AS (
    SELECT * 
    FROM {{ ref('addresses_snapshot') }}
    ),


addresses AS (
    SELECT
      ADDRESS_ID,
      cast (left (address,charindex(' ', address, 1))as numeric ) as address_number,
      cast (substr(address,charindex(' ', address, 1))as varchar(256)) as address_name ,
      ZIPCODE ,
      COUNTRY ,
      STATE ,
      _FIVETRAN_DELETED ,
      _FIVETRAN_SYNCED,
      date(DBT_VALID_TO) as dato_no_valido_desde

    FROM stg_sql_server_dbo_addresses
    --where STATE!='district of columbia'---hay una direccion donde en estado pone distrito de columbia y eso NO ES UN ESTADO asi que habria que dar reporte para cambiar esto
    )


SELECT * FROM addresses