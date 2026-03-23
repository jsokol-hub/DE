CREATE SCHEMA IF NOT EXISTS analytics;
DROP TABLE IF EXISTS analytics.cafe_orders;
CREATE TABLE analytics.cafe_orders (
    id SERIAL PRIMARY KEY,
    order_id TEXT,
    order_date DATE,
    customer_name TEXT,
    drink TEXT,
    "size" TEXT,
    price NUMERIC,
    price_tier TEXT,
    branch TEXT,
    payment_method TEXT,
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)