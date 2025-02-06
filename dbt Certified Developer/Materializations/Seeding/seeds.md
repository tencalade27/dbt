+ Seeds are CSV files stored in your dbt project that can be loaded into the database as tables.
+ Useful for static reference data (e.g., country codes, category mappings).
+ Stored in the /seeds folder.

Why Use Seeds?
+ ✅ Reference Data: Store static lookup tables inside dbt.
+ ✅ Easy Updates: Modify the CSV and re-run dbt seed.
+ ✅ Lightweight & Fast: No need for external ETL pipelines for simple datasets.

Final Thoughts
+ Use Analyses for ad-hoc queries and debugging.
+ Use Seeds for reference data that needs to live inside your warehouse.
