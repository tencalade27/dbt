## Key Fields in Exposures
Field	        | Description
----------------------------------------------------------------------------------
name	        | Unique name for the exposure.
type	        | Type of downstream use case (dashboard, ml, application, etc.).
owner	        | Who owns this exposure? (Name, email)
description	  | Brief summary of the exposure.
depends_on	  | Which dbt models or sources this exposure relies on.
url	          | Link to the report, dashboard, or ML pipeline.
maturity	    | Business criticality (low, medium, high).

## When Should You Use Exposures?
+ ✅ You have business-critical dashboards (Looker, Power BI, Tableau) that rely on dbt models.
+ ✅ You want visibility into what depends on your data (dashboards, ML models, etc.).
+ ✅ You need better impact analysis for data model changes.
+ ✅ Your team practices data governance and documentation.
