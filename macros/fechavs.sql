{% test fechavs(model, column_name) %}

select *
from {{ model }}
WHERE date({{ column_name }}) < date(created_at) 
and
{{ column_name }} is not null 


{% endtest %}

