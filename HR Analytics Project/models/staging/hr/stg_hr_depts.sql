select
  *
from {{ source('hr', 'departments') }}
