-----------------------------------------------------------------------
Model Type	           | Description
-----------------------------------------------------------------------
View (default)	       | Runs every time you query, does not store data.
-----------------------------------------------------------------------
Table	                 | Materialized as a physical table in the warehouse.
-----------------------------------------------------------------------
Incremental	           | Updates only new/changed records.
-----------------------------------------------------------------------
Ephemeral	             | Temporary table only used within dbt.
