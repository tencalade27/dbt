select
  e.employee_id,
  e.first_name,
  e.last_name,
  e.hire_date,
  e.termination_date,
  e.employee_status,
  e.tenure_years,
  e.department_id,
  d.department_name,
  e.manager_id,
  o.manager_first_name,
  o.manager_last_name
from {{ ref('stg_hr_employees') }} e
left join {{ ref('stg_hr_departments') }} d
  on e.department_id = d.department_id
left join {{ ref('int_employee_org_structure') }} o
  on e.employee_id = o.employee_id

-- dbt run --select marts.hr.dim_employee
