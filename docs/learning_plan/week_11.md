# Week 11

## Main goal
dbt tests + documentation.

## Tuesday — Built-in tests
- Add tests to staging models in `models/staging/schema.yml`:
  - `unique` on order_id
  - `not_null` on order_id, branch, drink
  - `accepted_values` on payment_method (cash, card)
- Run `dbt test` — see which pass/fail

## Wednesday — Custom tests and relationships
- Add `relationships` test: stg_cafe_orders.branch → stg_branches.branch_name
- Create a custom test (singular test) in `tests/`:
  - Example: check that price > 0 for all orders
- Run `dbt test` again

## Thursday — Documentation
- Add descriptions to models and columns in schema.yml
- Run `dbt docs generate` then `dbt docs serve`
- Explore the generated documentation site and lineage graph
- This is what you show in interviews: "here's my data lineage"

## Definition of done
- Tests cover key columns (unique, not_null, relationships)
- At least one custom test exists
- `dbt docs serve` shows your project with lineage
