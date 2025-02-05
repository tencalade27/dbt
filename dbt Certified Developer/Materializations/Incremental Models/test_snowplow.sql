select * 
from {{ source('snowplow', 'events') }}
order by collecto_tstamp desc;

-- Sidenote for tactics:
  -- Think about how to materialize the model when thinking from the perspective of a downstream user:
    -- Start with a view, if that takes to long to query, switch to a table
    -- if the table takes too long to query, switch to an incremental model

{{ config(
  materialized = 'incremental'
  unique_key = 'page_view_id'
) }}

with events as (
  select * 
  from {{ source('snowplow', 'events') }}
  {% if is_incremental() %}
    where collector_tstamp >= (select dateadd('day', -3, max(max_collector_tstamp)) from {{ this }})
      -- {{ this }} represents the currently existing database object mapped to this model
      -- is_incremental() checks for 4 conditions:
        -- 1. Does this model already exist as an object in the database
        -- 2. Is that database object a table?
        -- 3. Is this model configured with materialized = 'incremental'?
        -- 4. Was the --full-refresh flag passed to this dbt run?
        -- If 1. Yes, 2. Yes, 3. Yes, 4. No, then dbt confirms this to be an incremental run.
  {% endif %}
),
page_views as (
  select * from events
  where event = 'page_view'
),
aggregated_page_events as (
  select 
    page_view_id,
    count(*) * 10 as approx_time_on_page,
    min(derived_tstamp) as page_view_start,
    max(collector_tstamp) as max_collector_tstamp
  from events
  group by 1
),
joined as (
  select *
  from page_views
  left join aggregated_page_events using (page_view_id)
),
indexed as (
  select 
    *,
    row_number() over (
      partition by session_id
      order by page_view_start
    ) as page_view_in_session_index,
    row_number() over (
      partition by anonymous_user_id
      order by page_view_start
    ) as page_view_in_user_index
  from joined
)
select * from indexed;
