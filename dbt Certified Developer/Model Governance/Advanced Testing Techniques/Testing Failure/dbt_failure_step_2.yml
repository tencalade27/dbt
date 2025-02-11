-- Step 2: Add an on-run-end Hook in dbt_project.yml
    -- Modify dbt_project.yml to insert test failures into your database after every run:
on-run-end:
  - >
    INSERT INTO dbt_test_failures
    SELECT 
        current_timestamp() as test_execution_time,
        model as model_name,
        column_name,
        test_shortname as test_type,
        failures as failed_rows,
        'Test failed' as failure_reason
    FROM {{ ref('dbt_test_results') }}
    WHERE failures > 0
-- What This Does:
    -- Runs after dbt tests finish
    -- Inserts failed test results into dbt_test_failures
    -- Only stores failed test cases (ignores successful ones)
