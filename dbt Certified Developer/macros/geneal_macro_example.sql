-- macros/remove_nulls.sql
{% macro remove_nulls(column) %}
  COALESCE({{ column }}, 'N/A')
{% endmacro %}

  -- when used in a model:
SELECT 
  id, 
  {{ remove_nulls('customer_name') }} AS customer_name
FROM customers
