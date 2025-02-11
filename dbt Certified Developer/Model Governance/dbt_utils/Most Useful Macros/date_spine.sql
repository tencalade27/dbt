-- date_spine – Generate Date Ranges
    -- Creates continuous date ranges, even when there are missing dates in the data.

SELECT * FROM {{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2023-01-01' as date)",
    end_date="cast('2024-01-01' as date)"
) }}

-- why use it?
    -- fills in missing dates in reports
    -- prevents gaps in time series analysis
