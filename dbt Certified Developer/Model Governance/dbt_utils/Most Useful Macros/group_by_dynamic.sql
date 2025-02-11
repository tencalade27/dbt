-- group_by – Dynamic Grouping
    -- Instead of manually writing GROUP BY statements, this macro dynamically generates them based on column count.

SELECT 
    customer_id,
    SUM(sales) AS total_sales
FROM {{ ref('orders') }}
GROUP BY {{ dbt_utils.group_by(n=1) }}  -- Groups by customer_id

-- Why use it?
    -- Avoids error when adding/removing columns
    -- reduces manual SQL writing
