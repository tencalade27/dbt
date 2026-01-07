select
  employee_id,
  base_salary,
  bonus,
  effective_date
from {{ source('hr', 'compensation') }}

-- dbt run --select staging.hr.stg_hr_compensation, to check for no errors
