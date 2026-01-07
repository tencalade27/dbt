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

## Project Structure
- **Sources**: Raw HR employee, department, and compensation data
- **Staging**: Standardized and documented HR data models
- **Intermediate**: Business logic for salary history and org hierarchy
- **Marts**: BI-ready dimensions and fact tables

## Data Quality & Governance
- Source definitions with documentation
- Column-level tests (not null, unique, accepted values)
- Controlled transformations and grain enforcement
- PII-aware modeling approach

## Key Models
- `dim_employee`
- `fct_employee_compensation`

## Business Use Cases
- Workforce demographics reporting
- Compensation analysis
- Management span-of-control analysis
- Executive HR dashboards

---

## dbt Concepts Demonstrated:
- Layered model design (staging -> intermediate -> marts)
- Window functions for reporting most recent records
- Column-level tests & relationships
- Source refreshness checks
- Documentation & exposures
- Handling sensitive PII data responsibly
