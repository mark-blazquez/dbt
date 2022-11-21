{{ config(
    materialized='incremental'
    ) 
    }}


WITH stg_google_sheets_budgets AS (
    SELECT * 
    FROM {{ source('google_sheets','budgets') }}
    ),

renamed_casted AS (
    SELECT
          _row
        , month
        , quantity 
        , _fivetran_synced
    FROM stg_google_sheets_budgets
    )

SELECT * FROM renamed_casted

{% if is_incremental() %}

  where _fivetran_synced > (select max(_fivetran_synced) from {{ this }})

{% endif %}