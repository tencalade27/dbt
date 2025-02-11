-- safe_divide – Avoid Division by Zero
    -- Prevents errors when dividing by zero.

SELECT 
    customer_id, 
    {{ dbt_utils.safe_divide('revenue', 'orders') }} AS avg_order_value
FROM {{ ref('customer_metrics') }}

-- Why use it?
    -- prevents division errors that can break transformations
