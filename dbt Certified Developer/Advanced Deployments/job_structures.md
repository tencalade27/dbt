# Review
## dbt build
+ dbt build is a smart combination of dbt run and dbt test that will also build your snapshots and seeds. All of this is done in DAG order from left to right. This is particularly helpful for only continuing to build your DAG downstream from a node if the tests pass on that node.

## Common deployment jobs
+ Standard job - this jobs is typically just dbt build and will rebuild your entire DAG while including incremental logic.
+ Full refresh job - this job similar will use dbt build except it will pass the full refresh flag. This will force incremental models to be dropped and materialized from scratch and seeds to be dropped and rebuilt as well.
+ Time sensitive - this is a job that usually has a time sensitive business use case. You might consider refreshing marketing data or sales data more frequently than your standard job. You can accomplish this by using model selector syntax with your commands.
+ Fresh rebuild - fresh rebuild allows you to only rebuild models downstream from sources that have been updated since the previous run.

## One off vs. unified jobs
+ There are chances that you have jobs that run at the same time and rebuild some share resources. In these cases, it can be helpful to use model selector syntax that allows you to select the intersection or union of models rather than running jobs individually.
