select
  department_id,
  department_name,
  cost_center
from {{ source('hr', 'departments') }}


-- dbt run --select staging.hr.stg_hr_departments, look for no errors
