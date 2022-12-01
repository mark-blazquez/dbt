{% test email(model, column_name) %}


   select *
   from {{ model }}
   where  rlike({{ column_name }},'\\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}')= true


{% endtest %}