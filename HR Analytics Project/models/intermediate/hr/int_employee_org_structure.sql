select
  e.employee_id,
  e.first_name,
  e.last_name,
  e.manager_id,
  m.first_name as manager_first_name,
  m.last_name as manager_last_name,
  e.department_id
from {{ ref('stg_hr_employees') }} e
left join {{ ref('stg_hr_employees') }} m
  on e.manager_id = m.employee_id

-- dbt run --select intermediate.hr.int_employee_org_structure
