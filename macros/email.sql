{% test codigo_postal(model, column_name) %}


   select *
   from {{ model }}
   where {{ column_name }} 


{% endtest %}