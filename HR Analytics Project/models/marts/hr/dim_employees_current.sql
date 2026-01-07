select
  employee_id,
  first_name,
  last_name,
  department_id,
  manager_id,
  hire_date,
  termination_date
from {{ ref('hr_employees_snapshot') }}
where dbt_valid_to is null
