{% macro pivot(column, values) %}
  case
  {% for value in values %}
    when {{ column }} = '{{ value }}' then '{{ value }}'
  {% endfor %}
  else 'Other'
  end
{% endmacro %}

Select
  id,
  {{ pivot('category', ['Electronics', 'Clothing', 'Books']) }} as category_group
From {{ ref('sales_data') }}
