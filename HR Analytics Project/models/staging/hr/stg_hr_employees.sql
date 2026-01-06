select
  employee_id,
  first_name,
  last_name,
  date_of_birth,
  hire_date,
  termination_date,
  department_id,
  manager_id,
  case
    when termination_date is null then 'Active'
    else 'Terminated'
  end as employee_status
from {{ source('hr', 'employees') }}
