-- dbt will default the query to create a view in Snowflake.
-- Use the config() function to manually dictate the configuration of the following query
-- if you want the resulting creation to be something other than a view.
-- In this case, we want to create an actual table instead of a view.
-- This config() is only needed if the paraters in the .yml file have not been set.

{{   
    config(
        materialized='table'
    )
}}

-- Now we actually run the query that will create the resulting model by which the table will be built.
    
with customers as (
    select *
    from {{ ref('stg_jaffle_shop__customers') }} -- this macro function ref() establishes the dependency between tables/views.
),

orders as (
    select *
    from {{ ref('fct_orders') }} -- this macro function ref() establishes the dependency between tables/views.
),

customer_orders as (
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as lifetime_value
    from orders
    group by 1
),

final as (
    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce (customer_orders.number_of_orders, 0) as number_of_orders,
        customer_orders.lifetime_value
    from customers
    left join customer_orders using (customer_id)
)

select * from final
