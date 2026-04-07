# Week 12

## Main goal
dbt advanced features + Phase 3 polish.

## Tuesday — Incremental models (intro)
- Read about incremental materialization: https://docs.getdbt.com/docs/build/incremental-models
- Convert fct_orders to incremental (if it makes sense for your data)
- Understand: `is_incremental()`, `unique_key`, when to use incremental vs table

## Wednesday — Macros and Jinja basics
- Create a simple macro in `macros/`:
  - Example: `cents_to_dollars(column)` that divides by 100
  - Or: `generate_schema_name` to customize schema naming
- Use the macro in a model
- Understand: macros = reusable SQL snippets

## Thursday — Phase 3 review
- Clean up dbt project: remove unused models, fix warnings
- Run full pipeline: Python ETL → dbt run → dbt test
- Write `docs/reviews/phase_3_review.md`:
  - What dbt concepts you learned
  - How it compares to your Python transforms
  - What you'd do differently

## Definition of done
- Incremental model concept understood (implemented if data allows)
- At least one macro exists
- Full pipeline works end-to-end
- Phase 3 review written
