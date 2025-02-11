# Storing dbt Test Failures in a Database
By default, dbt only logs test failures in the command output and artifacts (target/ folder). However, for better monitoring and troubleshooting, storing test failures in a database allows you to:

+ ✅ Track failures over time (historical trends)
+ ✅ Integrate test results into dashboards (e.g., Power BI, Tableau)
+ ✅ Trigger alerts when issues arise
+ ✅ Enable automated triaging of data quality issues
