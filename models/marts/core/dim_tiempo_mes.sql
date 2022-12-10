{{ config(materialized='table') }}

{%- set datepart = "month" -%}
{%- set start_date = "TO_DATE('2020/01/01', 'yyyy/mm/dd')" -%}
{%- set end_date = "TO_DATE('2023/01/01', 'yyyy/mm/dd')" -%}

WITH date AS (
    {{ dbt_utils.date_spine(datepart=datepart, 
                            start_date=start_date,
                            end_date=end_date) }}
)

SELECT DATE_{{datepart}} as month_year,year(DATE_{{datepart}})*100+month(DATE_{{datepart}}) as id_anio_mes FROM date