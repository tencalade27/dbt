# basic syntax
dbt clone --from <source_env> --to <target_env>
# this duplicates all models from the source to the target without rerunning transformations

# example 1:
dbt clone --from production --to dev
# this quickly creates a testable dataset for development

# example 2:
dbt clone --from production --to dev --select customers
# this creates an environment to test a single model without duplicating everything

# example 3:
dbt clone --from analytics.prod --to analytics.backup
# this creates an efficient environment for snapshots or disaster recovery
