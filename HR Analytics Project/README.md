# HR Analytics dbt Project

## Overview
This project demonstrates ability to build a production-style HR analytics data mart using dbt. It models employee (EE) demographics, compensation, tenure, and management structure while applying analytics engineering best practices.

The project is designed to reflect rela-world dbt workflows, including:
- Source modeling
- Staging, intermediate, and mart layers
- Data testing and documentation
- Governance considerations for sensitive HR data

---
## Tech Stack:
- dbt Cloud
- SQL
- Cloud Data Warehouse (i.e., Snowflake, BigQuery, Redshift)
  - (Snowflake was used for this project)
- GitHub (version control)

## Data Model
### Source Tables:
- raw.hr.employees
- raw.hr.departments
- raw.hr.compensation

### Staging Models:
- stg_hr_employees
- stg_hr_departments
- stg_hr_compensation

### Intermediate Models:
- int_employee_latest_comp
- int_employee_org_structure

### Final Analytics Models (Marts):
- dim_employee
- fct_employee_compensation

These models support common HR analytics use cases, such as:
- Workforce demographics reporting
- Compensation analysis
- Tenure & seniority reporting
- Manager-to-employee relationships
- Executive HR dashboards

---

## dbt Concepts Demonstrated:
- Layered model design (staging -> intermediate -> marts)
- Window functions for reporting most recent records
- Column-level tests & relationships
- Source refreshness checks
- Documentation & exposures
- Handling sensitive PII data responsibly
