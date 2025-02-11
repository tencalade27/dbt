-- unpivot – Flatten Columns into Rows
    -- Converts wide tables into long tables, useful for reporting.

SELECT * FROM 
{{ dbt_utils.unpivot(
    relation=ref('customer_spending'),
    cast_to='float',
    exclude=['customer_id']
) }}

-- Why use it
    -- works in databases that don't support native unpivoting
