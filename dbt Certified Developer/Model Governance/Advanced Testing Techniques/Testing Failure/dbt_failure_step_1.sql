-- 1️⃣ Capture Test Failures Using on-run-end Hook
    -- The best way to store test results is to use a post-run hook to log failures into a table.

-- Step 1: Create a Table for Storing Failures
CREATE TABLE dbt_test_failures (
    test_execution_time TIMESTAMP,
    model_name STRING,
    column_name STRING,
    test_type STRING,
    failed_rows INT,
    failure_reason STRING
);
