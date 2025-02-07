# Best Practices for Cross-Project References
## Version Control
Use specific revisions or tags in packages.yml for stability:
Example: 

packages:
  - git: "https://github.com/company/dbt_finance.git"
    revision: "v1.2.0"  # Fixed version for consistent results

## Documentation & Lineage
Clearly document which external models are referenced using dbt exposures.

## Access Control
Use Access Modifiers (public, protected, private) to control visibility:
Example:

models:
  - name: fact_revenue
    access: public  # Allows cross-project access

## Testing
Implement tests to ensure external models meet quality standards:
Example:

models:
  - name: fact_revenue
    tests:
      - not_null:
          column_name: revenue_amount
