# When to Use dbt_utils vs. Custom Macros

Task	                         | Use dbt_utils?	                   | Use Custom Macros?
-------------------------------|-----------------------------------|--------------------------
Pivoting/Unpivoting	           | ✅	                             | ❌
Generating surrogate keys	     | ✅	                             | ❌
Complex business logic	       | ❌	                             | ✅
Standardized tests	           | ✅	                             | ❌
Custom database-specific logic | ❌	                             | ✅
