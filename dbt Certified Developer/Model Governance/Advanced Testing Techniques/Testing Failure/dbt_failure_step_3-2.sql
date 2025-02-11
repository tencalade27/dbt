-- For Postgres, set up an email alert:
CREATE OR REPLACE FUNCTION send_test_failure_alert() RETURNS void AS $$
DECLARE
    failures INT;
BEGIN
    SELECT COUNT(*) INTO failures
    FROM dbt_test_failures
    WHERE test_execution_time >= NOW() - INTERVAL '1 hour';

    IF failures > 0 THEN
        -- Replace with your email function
        PERFORM send_email('data-team@example.com', 'dbt Test Failure Alert', 'Check the dbt_test_failures table.');
    END IF;
END;
$$ LANGUAGE plpgsql;
-- ✅ This automates email alerts when failures occur
