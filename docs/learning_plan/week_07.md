# Week 7

## Main goal
Data quality framework + config-driven pipeline.

## Tuesday — Config-driven pipeline
- Move hardcoded values (file paths, table names, column mappings) into a config file or dict
- Pipeline should read config and execute — no pipeline-specific code for each source
- This is a key DE pattern: config over code

## Wednesday — Data quality checks in SQL
Write `sql/quality/data_quality_checks.sql`:
- Row count comparison: staging vs analytics (should match minus filtered rows)
- NULL percentage per column
- Uniqueness check on business key
- Value range checks (price > 0, date within expected range)
- Freshness check (max loaded_at)

These are standard DQ checks that appear in every production pipeline.

## Thursday — Data quality in Python
- Add a validation step between transform and load
- Check: no duplicate order_ids, price is numeric where not NULL, date format is valid
- Return a report dict: {total_rows, valid_rows, invalid_rows, issues: [...]}
- Log the report; optionally save rejected rows to a separate file

## Definition of done
- Pipeline is config-driven
- SQL quality checks exist
- Python validation step returns a structured report
