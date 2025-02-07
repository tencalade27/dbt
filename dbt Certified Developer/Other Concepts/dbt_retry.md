## What is dbt retry?
dbt retry is a built-in mechanism to automatically retry failed models instead of restarting the entire run.

+ Useful for transient errors (e.g., network issues, database locks).
+ Saves time by only retrying failed models rather than restarting everything.
+ Helps stabilize production dbt runs.

## How to Use dbt retry
If your dbt run or dbt test fails, you can retry only the failed models using: dbt retry
This command:
+ ✔ Identifies previously failed models from the last run.
+ ✔ Retries only the failed models, skipping successful one

## Adding Retries to dbt Runs
To automatically retry failures during a run, use the --fail-fast flag: dbt run --fail-fast --max-retries 3
+ --fail-fast: Stops immediately if a model fails (useful for debugging).
+ --max-retries 3: Retries up to 3 times before marking the run as failed.

## When to Use dbt retry?
+ ✅ Intermittent failures (network issues, warehouse load, temporary locks).
+ ✅ CI/CD pipelines where automated reruns are preferred over manual restarts.
+ ✅ Large projects where a full restart would take too long.
