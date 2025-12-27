/*
This creates a temporary named result set called 'payments' and runs a query to ensure that all values are positive.
*/
with payments as (
    select * from {{ ref('stg_stripe__payments') }}
)
select
    order_id,
    sum(amount) as total_amount
from payments
group by order_id
having total_amount < 0
