
{{
  config(
    materialized='view'
  )
}}

WITH stg_google_sheets AS (
    SELECT * 
    FROM {{ source('google_sheets', 'budgets') }}
    ),

budgets AS (
    SELECT
          _row as id_budget
        , product_id
        , quantity
        , month as order_date
        , _fivetran_synced AS date_load
    FROM src_google_sheets
    )

SELECT * FROM budgets