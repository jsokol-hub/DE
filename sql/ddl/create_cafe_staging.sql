CREATE SCHEMA IF NOT EXISTS staging;
DROP TABLE IF EXISTS staging.cafe_sales;
CREATE TABLE staging.cafe_sales (
    id SERIAL PRIMARY KEY,
    order_id TEXT,
    order_date TEXT,
    customer_name TEXT,
    drink TEXT,
    "size" TEXT,
    price TEXT,
    branch TEXT,
    payment_method TEXT,
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);