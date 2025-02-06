-- dbt analyses are ad-hoc SQL queries that don’t transform data 
--but are useful for exploratory analysis, debugging, or reporting.

with orders as (
  select * from {{ ref('stg_orders') }}
),

daily as (
  select
    order_date,
    count(*) as order_num
  {% for order_status in ['returned', 'completed', 'return_pending', 'shipped', 'placed'] %}
    sum(case when status = {{ order_status }} then 1 else 0 end) as {{ order_status }}_total
  {% endfor %}
  from orders
  group by 1
),

compared as (
  select *,
    log(order_num) over (order by order_date) as previous_day_order_num
  from daily
)
  
select * from compared;
