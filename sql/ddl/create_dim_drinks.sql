CREATE SCHEMA IF NOT EXISTS analytics;
DROP TABLE IF EXISTS analytics.dim_drinks;
CREATE TABLE analytics.dim_drinks (
    drink_id SERIAL PRIMARY KEY,
    drink_name TEXT UNIQUE,
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO analytics.dim_drinks (
    drink_name
)
SELECT DISTINCT drink
FROM staging.cafe_sales;