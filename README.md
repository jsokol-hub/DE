# Sales Data Pipeline

A portfolio-friendly Data Engineering mini-project: loading sales transaction data from CSV into PostgreSQL with Python.

## What this project demonstrates

- **Extract**: reading structured data from a CSV file
- **Transform**: cleaning, deduplication, format normalization
- **Load**: inserting data into a PostgreSQL staging table via SSH tunnel
- **Analysis**: SQL queries to validate and explore loaded data

## Data source

Sample sales transaction data (`data/raw/sales_data.csv`) — 50 rows with intentional data quality issues:

- inconsistent date formats (YYYY-MM-DD vs DD/MM/YYYY)
- missing values (customer names, cities)
- duplicate rows
- mixed-case categories
- extra whitespace in fields

## How to run

1. Copy `.env.example` to `.env` and fill in your SSH / PostgreSQL credentials
2. Install dependencies: `pip install -r requirements.txt`
3. Create the staging table: run `sql/ddl/create_staging_table.sql` on your database
4. Run the pipeline: `python src/pipelines/run_pipeline.py`
5. Check results: run queries from `sql/analysis/first_checks.sql`

## Project structure

```text
DE/
├── data/raw/              ← source CSV files
├── src/
│   ├── extract/           ← read source data
│   ├── transform/         ← clean and normalize
│   ├── load/              ← write to PostgreSQL
│   ├── common/            ← config, DB connection
│   └── pipelines/         ← pipeline entry points
├── sql/
│   ├── ddl/               ← table definitions
│   ├── transformations/   ← SQL transforms (later)
│   └── analysis/          ← analytical queries
└── tests/                 ← tests (later)
```

## Study rhythm

- Sunday: planning and review
- Tuesday: project deep work
- Wednesday: SQL and data modeling
- Thursday: Python ETL / ELT

## Roadmap

See `docs/learning_plan/03_roadmap_16_weeks.md` for the full 16-week plan.
