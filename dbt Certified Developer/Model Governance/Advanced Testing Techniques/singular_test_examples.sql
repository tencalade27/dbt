-- Refunds have a negative amount, so the total amount should always be >= 0.
-- Therefore return records where this isn't true to make the test fail
-- Run with dbt test (or dbt test --data)

select
    order_id,
    sum(amount) as total_amount
from {{ ref('orders' )}}
group by 1
having not(total_amount >= 0)

-- assert_unique_customers_customer_id.sql
  
select
    customer_id
from {{ ref('customers') }}
group by customer_id
having count(*) > 1
