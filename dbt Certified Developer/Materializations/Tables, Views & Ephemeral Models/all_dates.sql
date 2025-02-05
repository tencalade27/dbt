{{ config (
  materialized = "table"
)}}

{{ dbt_utils.date_spine(
  datepart = "day",
  start_date = "to_date('01/01/2020', 'mm/dd/yyyy')",
  end_date = "to_date('01/01/2021', 'mm/dd/yyyy')"
  )
}}

-- Ephemeral models do not exist in the database
-- They are reusable code snippets
-- They are interpolated as VTE in a model that references this model.
