## What is State Management in dbt?
+ State management allows dbt to compare the current project state with a previous state (i.e., the last successful run).
+ It enables "smart" selective runs—meaning dbt will only process models that have changed or been impacted instead of re-running everything.

## Key Benefits:
+ ✅ Faster dbt runs by skipping unchanged models.
+ ✅ Improved efficiency in large projects.
+ ✅ Safer deployments by focusing on models that need updates.

## How Does It Work?
+ dbt by design is idempotent and stateless by default
  + Idempotent - when you execute a dbt build command multiple times with the same underlying data sources, you get the same results.
  + Stateless - each dbt build command runs independently of the results of the previous build, i.e. the results of the previous build do not inform / impact future runs

## Models, tests, exposures, snapshots
+ Dependencies between models
+ File hashes (to detect changes)
+ Using --state, dbt compares this file to the previous state to determine what needs to be rebuilt.

## When to Use State Management?
+ ✅ You are running incremental dbt deployments and want faster runs.
+ ✅ Your project has hundreds of models, and you don’t want to re-run everything.
+ ✅ You are using CI/CD pipelines and need to detect only changed models.
+ ✅ You want to avoid unnecessary database costs.
