{% test numero_telefono(model, column_name) %}


   select *
   from {{ model }}
   where  rlike({{ column_name }},'([0-9]{3}\)[0-9]{3}-[0-9]{4}')= true


{% endtest %}