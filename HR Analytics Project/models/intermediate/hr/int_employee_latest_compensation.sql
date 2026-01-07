with ranked_compensation as (
  select
    employee_id,
    base_salary,
    bonus,
    effective_date,
    row_number() over (
      partition by employee_id
      order by effective_date desc
    ) as comp_rank
  from {{ ref('stg_hr_compensation') }}
  )
select
  employee_id,
  base_salary,
  bonus,
  effective_date
from ranked_compensation
where comp_rank = 1

-- dbt run --select intermediate.hr.int_employee_latest_compensation
