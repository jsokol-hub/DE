CREATE SCHEMA IF NOT EXISTS analytics;
DROP TABLE IF EXISTS analytics.dim_customers;
CREATE TABLE analytics.dim_customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name TEXT UNIQUE,
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO analytics.dim_customers (
    customer_name
)
SELECT DISTINCT customer_name
FROM staging.cafe_sales;