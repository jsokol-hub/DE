CREATE SCHEMA IF NOT EXISTS analytics;
DROP TABLE IF EXISTS analytics.dim_branches;
CREATE TABLE analytics.dim_branches (
    branch_id SERIAL PRIMARY KEY,
    branch_name TEXT UNIQUE,
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO analytics.dim_branches (
    branch_name
)
SELECT DISTINCT branch
FROM staging.cafe_sales;