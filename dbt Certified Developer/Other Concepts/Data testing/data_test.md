dbt allows automated tests to catch errors before they hit production.

Test	           | Purpose
-----------------|-------------------------------
unique	         | Ensures values are unique.
not_null	       | Ensures no NULL values.
accepted_values  |	Checks if values match a predefined set.
relationships	   | Ensures foreign key integrity.
