-- Checks for differences in column values between two tables.

select * from {{ audit_helper.compare_column_values(
    a_relation=ref('staging_orders'),
    b_relation=ref('processed_orders'),
    column_name='order_status'
) }}

-- Use case: Detects incorrectly modified records
