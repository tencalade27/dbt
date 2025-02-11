-- Best for: detecting unexpected column changes (new, missing, or renamed)
-- Example: Comparing the current schema with the expected schema
{% macro test_schema_drift(model, expected_columns) %}
SELECT column_name
FROM information_schema.columns
WHERE table_name = '{{ model }}'
AND column_name NOT IN ({{ expected_columns | join(",") }})
{% endmacro %}

-- To be used in combination with a schema yaml file like this:
models:
  - name: transactions
    tests:
      - test_schema_drift:
          expected_columns: ['transaction_id', 'customer_id', 'amount', 'order_date']
-- This alerts when columns are added or removed unexpectedly
