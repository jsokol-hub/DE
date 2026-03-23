CREATE SCHEMA IF NOT EXISTS staging;
DROP TABLE IF EXISTS staging.raw_sales;
CREATE TABLE staging.raw_sales (
    id SERIAL PRIMARY KEY,
    order_id TEXT,
    order_date TEXT,
    customer_id TEXT,
    customer_name TEXT,
    product_name TEXT,
    category TEXT,
    quantity TEXT,
    unit_price TEXT,
    city TEXT,
    country TEXT,
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);