# Week 9

## Main goal
dbt setup + first staging models.

## Sunday — dbt introduction
- Install dbt-core and dbt-postgres: `pip install dbt-core dbt-postgres`
- Read: https://docs.getdbt.com/docs/introduction (15-20 min)
- Understand the core idea: dbt = SQL + templating + DAG + tests + docs

## Tuesday — dbt project setup
- Run `dbt init cafe_dbt` (or similar name) in a new folder or inside DE/
- Configure `profiles.yml` to connect to your PostgreSQL (same credentials as .env)
- Run `dbt debug` — make sure connection works
- Explore the generated folder structure: models/, tests/, macros/, dbt_project.yml

## Wednesday — First staging models
- Create `models/staging/stg_cafe_orders.sql`
- This model should SELECT from `staging.cafe_sales` with:
  - Proper column types (CAST)
  - Renamed columns if needed (snake_case)
  - Basic cleaning (already done in your Python transform, now replicate in SQL)
- Run `dbt run` — see the model materialize as a view or table

## Thursday — Multiple staging models
- Create `stg_branches.sql`, `stg_drinks.sql`, `stg_customers.sql` — simple SELECT DISTINCT
- Configure materialization in `dbt_project.yml` (views for staging)
- Run `dbt run` and verify all models created

## Definition of done
- dbt project exists and connects to database
- 4 staging models run successfully
- You understand: model = SELECT, dbt run = execute all models
