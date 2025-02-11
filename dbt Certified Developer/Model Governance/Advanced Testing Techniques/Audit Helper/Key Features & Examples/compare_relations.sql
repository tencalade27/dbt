-- Compares row counts between two tables to detect missing data.

select * from {{ audit_helper.compare_relations(
    a_relation=ref('staging_users'), 
    b_relation=ref('transformed_users')
) }}

-- Use case: Ensures that no data is lost after transformations
