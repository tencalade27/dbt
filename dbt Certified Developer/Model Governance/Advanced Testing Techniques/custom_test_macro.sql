-- Use for when complex logic isn't covered by built-in tests
-- Example: ensuring customer_lifetime_value is always positive

{% macro assert_positive(model, column_name) %}
SELECT * 
FROM {{ model }} 
WHERE {{ column_name }} < 0
{% endmacro %}
