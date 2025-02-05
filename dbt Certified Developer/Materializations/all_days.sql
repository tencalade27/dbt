{{ config (
    materialized="table"
)}}

{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2020-01-01' as date)",
    end_date="cast('2021-01-01' as date)"
   )
}}

select

  {{ dbt_utils.surrogate_key(['customer_id', 'order_date']) }} as id,
  customer_id,
  order_date,
  count(*)

from {{ ref('stg_orders') }}
group by 1,2,3
