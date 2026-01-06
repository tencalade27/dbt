select
  employee_id,
  first_name,
  last_name,
  date_of_birth,
  hire_date,
  termination_date,
  case 
    when termination_date is null then date_part('year', current_date) - date_part('year', hire_date)
    else date_part('year', termination_date) - date_part('year', hire_date)
  end as tenure_years,
  case
    when termination_date is null then 'active'
    else 'terminated'
  end as employee_status,
  department_id,
  manager_id
from {{ source('hr', 'employees') }}
