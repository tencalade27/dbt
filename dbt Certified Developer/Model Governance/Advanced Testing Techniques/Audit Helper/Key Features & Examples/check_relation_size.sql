-- Checks table size before and after ETL runs.

select * from {{ audit_helper.check_relation_size(
    relation=ref('transactions')
) }}

-- Use case: Prevents unexpected data bloat or truncation
