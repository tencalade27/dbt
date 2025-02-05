-- models/orders_incremental.sql
{{ config(materialized='incremental', unique_key='id') }}

SELECT * FROM raw.orders
{% if is_incremental() %}
   WHERE order_date >= (SELECT MAX(order_date) FROM {{ this }})
{% endif %}
