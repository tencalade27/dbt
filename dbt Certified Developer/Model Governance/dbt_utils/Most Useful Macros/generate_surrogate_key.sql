-- generate_surrogate_key – Create Unique Row Identifiers
    -- Creates a hash-based unique key (useful when combining multiple columns).

SELECT 
    {{ dbt_utils.generate_surrogate_key(['customer_id', 'order_date']) }} AS unique_order_id
FROM {{ ref('orders') }}

-- why use it
    -- ensures consistent unique identifiers
    -- works across different databases
