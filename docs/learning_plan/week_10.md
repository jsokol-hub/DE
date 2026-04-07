# Week 10

## Main goal
dbt marts + refs + sources.

## Tuesday — Sources
- Define sources in `models/staging/sources.yml`
- Replace hardcoded table names with `{{ source('staging', 'cafe_sales') }}`
- This is how dbt tracks lineage

## Wednesday — Intermediate and mart models
- Create `models/marts/fct_orders.sql`:
  - Build from staging models using `{{ ref('stg_cafe_orders') }}`
  - Add price_tier calculation
  - Add foreign keys to dimension tables (or just keep as is for now)
- Create `models/marts/dim_branches.sql`, `dim_drinks.sql`, `dim_customers.sql`
  - Use `{{ ref('stg_branches') }}` etc.

## Thursday — Materializations
- Set marts to materialize as tables (not views) in dbt_project.yml
- Understand the difference: view = query on read, table = stored result
- Run `dbt run` and check that analytics schema has tables

## Definition of done
- sources.yml defines raw tables
- Marts exist and reference staging models
- `dbt run` builds the full DAG: raw → staging → marts
