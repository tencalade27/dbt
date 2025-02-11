-- Finds all column-level differences between two tables.

select * from {{ audit_helper.compare_all_columns(
    a_relation=ref('source_data'),
    b_relation=ref('final_table')
) }}

-- Use case: Validates data consistency across environments
