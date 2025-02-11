-- Best for detecting outliers in numerical fields
-- Example: Detect outlier transaction amounts
{% macro test_transaction_outliers(model, column_name) %}
WITH stats AS (
    SELECT 
        percentile_cont(0.95) WITHIN GROUP (ORDER BY {{ column_name }}) as upper_bound,
        percentile_cont(0.05) WITHIN GROUP (ORDER BY {{ column_name }}) as lower_bound
    FROM {{ model }}
)
SELECT * 
FROM {{ model }}
WHERE {{ column_name }} > (SELECT upper_bound FROM stats)
   OR {{ column_name }} < (SELECT lower_bound FROM stats)
{% endmacro %}
-- This detects transactions way outside the normal range
