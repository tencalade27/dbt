-- snapshots are used to capture historical data
{% snapshot snap_products %}

{{
  config(
    target_database = 'analytics'
    target_schema = 'dbt_tencalade_snapshots'
    unique_key = 'id'

    strategy = 'check'
    check_cols = ['price']
  )
}}

select id, price from {{ source('jaffle_shop_ext', 'products') }}

{% endsnapshot %}
---------------------------------------------------------------------------
{% snapshot mock_orders %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='analytics',
      target_schema=new_schema,
      unique_key='order_id',

      strategy='timestamp',
      updated_at='updated_at'
    )
}}

select * from analytics.{{target.schema}}.mock_orders

{% endsnapshot %}
