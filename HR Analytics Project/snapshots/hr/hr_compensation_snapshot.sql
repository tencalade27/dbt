{% snapshot hr_compensation_snapshot %}

{{
  config(
    target_schema='snapshots',
    unique_key='employee_id',
    strategy='timestamp',
    updated_at='updated_at'
  )
}}

select 
  employee_id,
  first_name,
  last_name,
  department_id,
  manager_id,
  hire_date,
  termination_date,
  updated_at
from {{ source('hr', 'employees') }}

{% endsnapshot %}

-- dbt snapshot
