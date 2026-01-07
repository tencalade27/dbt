{% snapshot hr_employees_snapshot %}

{{
  config(
    target_schema='snapshots',
    unique_key='employee_id',
    strategy='check',
    check_cols=[
      'first_name',
      'last_name',
      'department_id',
      'manager_id',
      'termination_date'
    ]
  )
}}

select 
  employee_id,
  first_name,
  last_name,
  department_id,
  manager_id,
  hire_date,
  termination_date
from {{ source('hr', 'employees') }}

{% endsnapshot %}
