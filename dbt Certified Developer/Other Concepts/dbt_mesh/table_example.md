A company has three teams using dbt:

Team	Owns These Models	Consumes These Models
Marketing	marketing_campaigns, customer_acquisition	dim_customers from Finance
Finance	dim_customers, fact_revenue	marketing_campaigns from Marketing
Product	user_engagement, feature_adoption	fact_revenue from Finance
