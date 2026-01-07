select
  e.employee_id,
  c.base_salary,
  c.bonus,
  c.effective_date
from {{ ref('int_employee_latest_compensation') }} c
inner join {{ ref'stg_hr_employees') }} e
  on c.employee_id = e.employee_id

-- dbt run --select marts.hr.fct_employee_compensation
