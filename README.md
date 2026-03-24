# Data Engineering Portfolio

Two mini ETL pipelines demonstrating core Data Engineering skills: CSV ingestion, data cleaning, PostgreSQL loading, SQL transformations, and analytics-ready table design.

## What this project demonstrates

- **Extract**: reading structured CSV data into Python
- **Transform**: cleaning, deduplication, date normalization, validation with logging
- **Load**: inserting data into PostgreSQL staging tables
- **SQL transformations**: CTEs, CASE WHEN, window functions (ROW_NUMBER, LAG, running totals)
- **Analytics layer**: staging → typed analytics table with derived fields
- **Data modeling**: grain definition, fact table design, business vs surrogate keys
- **Testing**: pytest unit tests for transform logic without database dependency

## Pipelines

### Sales pipeline

Source: `data/raw/sales_data.csv` — 50 rows with data quality issues (mixed date formats, missing values, duplicates, inconsistent casing).

Run:
1. Create table: `sql/ddl/create_staging_table.sql`
2. Execute: `python src/pipelines/run_pipeline.py`

### Cafe pipeline

Source: `data/raw/cafe_orders.csv` — 45 rows with similar quality issues.

Run:
1. Create tables: `sql/ddl/create_cafe_staging.sql`, then `sql/ddl/create_cafe_analytics.sql`
2. Execute: `python src/pipelines/run_cafe_pipeline.py`
3. Load analytics layer: `sql/transformations/staging_to_analytics.sql`

## Setup

1. Copy `.env.example` to `.env` and fill in PostgreSQL credentials
2. Install dependencies: `pip install -r requirements.txt`
3. Run tests: `python -m pytest tests/ -v`

## Project structure

```text
DE/
├── data/raw/                ← source CSV files
├── src/
│   ├── extract/             ← read source data
│   ├── transform/           ← clean, normalize, validate
│   ├── load/                ← write to PostgreSQL
│   ├── common/              ← DB connection, config
│   └── pipelines/           ← pipeline entry points
├── sql/
│   ├── ddl/                 ← staging and analytics table definitions
│   ├── transformations/     ← SQL transforms (staging → analytics)
│   └── analysis/            ← validation and exploration queries
├── tests/                   ← pytest unit tests
└── docs/
    ├── learning_plan/       ← weekly study plans
    └── modeling/            ← data model documentation
```
