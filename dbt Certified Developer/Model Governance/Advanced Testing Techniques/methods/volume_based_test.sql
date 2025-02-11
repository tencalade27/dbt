-- Best for detecting unexpected row count changes
-- Example: ensure daily transactions don't drop more than 20%
{% macro test_transaction_drop() %}
WITH previous_day AS (
    SELECT count(*) as row_count
    FROM {{ ref('transactions') }}
    WHERE transaction_date = current_date - interval '1' day
),
current_day AS (
    SELECT count(*) as row_count
    FROM {{ ref('transactions') }}
    WHERE transaction_date = current_date
)
SELECT * 
FROM current_day c
JOIN previous_day p
ON c.row_count < p.row_count * 0.8
{% endmacro %}
-- This catches sudden drops in transaction volumes, signaling potential data pipeline issues
