How each model materialization is stored when defined within the config() block inside SQL files:

Materialization	     | Purpose
-----------------------------------------------------------------------------------
table	               | Full refresh each run (slow, but reliable).
view	               | Light, always fresh, but slower queries.
incremental	         | Only updates new records (best for large datasets).
ephemeral	           | Temporary in-memory tables (good for breaking down logic).
