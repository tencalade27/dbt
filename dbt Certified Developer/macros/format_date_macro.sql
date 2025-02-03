-- Macros are reusable logic (similar to functions in Python) that can be called across multiple models

{% macro format_date(column_name) %}
  to_char({{ column_name }}, 'YYYY-MM-DD')
{% endmacro %}

-- Now we can use the macro inside a model:
Select
  id,
  {{ format_date('created_at') }} AS formatted_date
From {{ ref(stripe_payments) }}
