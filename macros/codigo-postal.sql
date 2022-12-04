{% test codigo_postal(model, column_name) %}


   select *
   from {{ model }}
   where {{ column_name }} =11111 and {{ column_name }} not between 00501 and 99950


{% endtest %}
