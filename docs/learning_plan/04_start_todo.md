# Start TODO for Cursor

This file is the practical entry point for the repository.

Use it when opening the project in Cursor and deciding what to do next.

---

## Current focus

Finish the first 4-week foundation block:
- PostgreSQL setup
- first mini ETL pipeline
- readable SQL
- validation and logging
- portfolio-friendly repo structure

---

## Recommended first mini-project options

Choose **one** and stick with it:

### Option A — CSV to PostgreSQL
Good if you want the simplest possible start.

Example scope:
- place one CSV file in `data/raw/`
- create a staging table
- load rows with Python
- clean basic fields
- write one aggregation query
- document the run flow

### Option B — JSON/API to PostgreSQL
Good if you want a more DE-flavored ingestion workflow.

Example scope:
- call one public API or read JSON
- normalize selected fields
- load into staging
- build one analytics-ready table
- add validation and logging

Recommendation:
- Start with **Option A** unless the API source is already easy and familiar.

---

## What to do first in Cursor

Open this repository and do the tasks in order.

### Task 1 — define the first project
Create or update `README.md` with:
- project goal
- data source
- expected output
- why this demonstrates DE skills

Definition of done:
- README has a short project description in plain language

### Task 2 — create the first DDL script
Create:
- `sql/ddl/create_staging_table.sql`

Include:
- one staging table
- appropriate column names
- simple and readable SQL

Definition of done:
- staging DDL exists and can be run manually

### Task 3 — create the first pipeline entry point
Create:
- `src/pipelines/run_pipeline.py`

Include:
- `main()`
- high-level pipeline flow
- logging setup
- calls to extract / transform / load steps

Definition of done:
- the file runs, even if the step functions are still minimal

### Task 4 — add the extract step
Create:
- `src/extract/read_source.py`

Include:
- read from a CSV or JSON source
- return structured rows
- log row count

Definition of done:
- source data can be loaded into Python successfully

### Task 5 — add the transform step
Create:
- `src/transform/clean_rows.py`

Include:
- basic field cleanup
- null handling
- simple type normalization

Definition of done:
- transformed output is cleaner than raw input

### Task 6 — add the load step
Create:
- `src/load/load_to_postgres.py`

Include:
- database connection
- insert or reload logic
- row count logging
- basic error handling

Definition of done:
- data lands in PostgreSQL staging

### Task 7 — add one analysis SQL file
Create:
- `sql/analysis/first_checks.sql`

Include:
- row count check
- null check
- one aggregation query
- one duplicate check if relevant

Definition of done:
- you can inspect whether the load worked correctly

---

## Suggested prompts to use in Cursor

These are good starting prompts for the agent.

### Prompt 1
Help me define a small portfolio-friendly first mini-project for this DE repository using PostgreSQL and Python. Keep the scope narrow and practical.

### Prompt 2
Create a simple `create_staging_table.sql` file for a staging table for this project. Keep it readable and explain the grain.

### Prompt 3
Create a minimal but clean `run_pipeline.py` entry point that calls extract, transform, and load steps with logging.

### Prompt 4
Help me implement a small CSV-to-PostgreSQL loading flow for this repository with readable code and basic validation.

### Prompt 5
Review my repository structure and suggest the smallest next useful improvement.

---

## First-week backlog

Keep the backlog intentionally small.

### Must do
- [ ] Choose project source
- [ ] Write README project goal
- [ ] Create staging DDL
- [ ] Create pipeline entry point
- [ ] Implement extract step
- [ ] Implement transform step
- [ ] Implement load step
- [ ] Add first analysis SQL checks

### Nice to have
- [ ] Add `.env.example`
- [ ] Add simple config module
- [ ] Add one validation helper
- [ ] Add one test or smoke check

---

## What success looks like by the end of week 1

By the end of the first week, you should have:
- one clearly defined mini-project
- one PostgreSQL staging table
- one runnable Python pipeline skeleton
- one successful data load
- one SQL file to inspect the result
- one README that explains what the project is

---

## Rule for task selection

When unsure what to do next:
1. choose the smallest task that moves the project forward
2. prefer finished pieces over broad exploration
3. make outputs inspectable
4. keep the repository readable enough for a future interviewer
