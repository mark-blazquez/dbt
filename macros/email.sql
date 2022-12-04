{% test email(model, column_name) %}


   select *
   from {{ model }}
   where  rlike({{ column_name }},'\\w+@[a-zA-Z0-9_.-]+?\.[a-zA-Z]{2,4}')= false


{% endtest %}