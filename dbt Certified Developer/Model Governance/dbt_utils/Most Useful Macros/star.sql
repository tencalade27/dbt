-- star – Dynamic SELECT * with Exclusions
    -- Automatically selects all columns except specific ones.

SELECT 
    {{ dbt_utils.star(ref('users'), except=["password", "ssn"]) }}
FROM {{ ref('users') }}

-- why use it?
    -- avoids manually listing columns
    -- keeps queries future-proof
