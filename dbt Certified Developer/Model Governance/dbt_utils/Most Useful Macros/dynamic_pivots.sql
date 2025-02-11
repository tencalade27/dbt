-- pivot – Dynamic Pivots in SQL
    -- Creates pivot tables without manually specifying column names.

SELECT * FROM 
{{ dbt_utils.pivot(
    relation=ref('sales_data'),
    column='region',
    values=['North', 'South', 'West'],
    agg='SUM',
    alias=True
) }}

-- Why use it?
    -- avoids manually listing pivot values
    -- works across databases (Snowflake, BigQuery, Redshift, Postgres, etc.)
