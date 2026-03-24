# Week 6

## Main goal
Star schema modeling + JOINs between tables.

## Tuesday — Build dimension tables
- Create dimension tables for cafe data: dim_branches, dim_drinks, dim_customers
- Each dimension has a surrogate key (SERIAL), a natural key, and descriptive attributes
- Write DDL files in `sql/ddl/`
- Populate them from staging data using SELECT DISTINCT

## Wednesday — Star schema + JOINs + theory
- Write a modeling note `docs/modeling/cafe_star_schema.md` that describes:
  - The fact table (cafe_orders) at the center
  - Dimensions around it
  - How they connect (foreign keys)
  - Draw it in text/ASCII or just describe it clearly
- Write SQL queries with JOINs: fact + dimension lookups
- Practice: LEFT JOIN, INNER JOIN — when to use which

Theory to study (write short notes in `docs/theory/`):
- Normal forms (1NF, 2NF, 3NF) — what they mean, when to denormalize for analytics
- ACID — what each letter means, relate to your own TRUNCATE+INSERT pattern
- DWH basics — staging / ODS / marts, how your project maps to these layers
Source: https://roadmapde.roadmappers.ru/content (DWH and Data Models sections)

## Thursday — SQL subqueries and HAVING
Write `sql/practice/subqueries_and_having.sql`:
- HAVING vs WHERE — filtering on aggregates
- Correlated subqueries
- EXISTS / NOT EXISTS
- Subquery in FROM vs subquery in WHERE

## Definition of done
- Dimension tables exist with DDL and populate scripts
- Star schema is documented
- JOIN and subquery practice file exists
