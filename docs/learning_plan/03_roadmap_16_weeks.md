# 16-Week Roadmap

## Phase 1 — Foundations through practice (Weeks 1–4)
Focus:
- PostgreSQL
- SQL transformations
- Python ETL structure
- first mini-project

Outcome:
- working mini ETL pipeline
- readable SQL files
- logging and basic validation

## Phase 2 — Better pipelines (Weeks 5–8)
Focus:
- idempotent processing
- data quality checks
- config and reproducibility
- project cleanup
- Docker introduction

Outcome:
- more reliable ETL workflow
- better local development setup

## Phase 3 — Analytics engineering layer (Weeks 9–12)
Focus:
- dbt setup and project structure
- staging models (stg_*)
- marts (fct_*, dim_*)
- sources and refs
- dbt tests (unique, not_null, relationships, custom)
- dbt docs and lineage
- incremental models (intro)
- macros and Jinja basics

Kafka moved to Phase 4 — different paradigm, better after batch is solid.

Outcome:
- clean transformation layer managed by dbt
- tests that run automatically
- documentation with lineage graph
- understanding of modern analytics engineering workflow

## Phase 4 — Streaming & Orchestration (Weeks 13–16)
Focus:
- Apache Kafka fundamentals (producers, consumers, topics, partitions)
- Streaming vs batch paradigm
- Airflow basics (DAGs, tasks, scheduling, dependencies)
- Orchestrating existing pipelines
- Integration: Kafka → Python → PostgreSQL
- Portfolio polish and interview prep

Outcome:
- working streaming pipeline (Kafka + Python consumer)
- Airflow DAG orchestrating dbt + custom tasks
- understanding of event-driven architecture
- portfolio-ready project with batch + streaming components
