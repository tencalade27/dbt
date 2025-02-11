version: 2

models:
  - name: customers
    description: One record per customer
    columns:
      - name: customer_id
        description: Primary key
        tests:
          - unique
          - not_null
          - dbt_utils.cardinality_equality:
              field: customer_id
              to: ref('stg_customers')
      - name: first_order_date
        description: NULL when a customer has not yet placed an order.
      - name: lifetime_value
        description: Lifetime value of a customer based on orders purchased
        tests: 
          - dollars_spent_greater_than_one:
              group_by_column: customer_id

  - name: orders
    description: Complete orders model including the amount associated with each order.
    tests:
      - dbt_utils.expression_is_true:
          expression: "amount >= 0"
    columns:
      - name: order_id
        description: Primary key for orders
        tests:
          - unique
          - not_null
      - name: amount
        description: Dollars spent per order
        tests: 
          - dollars_spent_greater_than_one:
              group_by_column: customer_id
          - dbt_expectations.expect_column_values_to_be_between: 
          # this will perform what the dbt_utils.expression-is-true test does!
              min_value: 0
              row_condition: "order_id is not null" 
              strictly: false
          - dbt_expectations.expect_column_mean_to_be_between: 
          # this will perform what our singular and generic tests do!
              min_value: 1
              group_by: [customer_id] 
              row_condition: "order_id is not null" # (Optional)
              strictly: false

      - name: customer_id
        tests:
          - relationships:
              to: ref('stg_customers')
              field: customer_id
          # this test should fail, use `dbt test -s orders --store-failures` to find results
          - unique

  - name: orders_by_date
    description: periodic snapshot showing orders and dollars placed on each day
    columns:
      - name: date_day
        description: Primary key for table
        tests:
          - unique
          - not_null
