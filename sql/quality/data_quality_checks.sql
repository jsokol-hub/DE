--QUERY 1
WITH staging_count as (
    SELECT COUNT(*) AS total_staging
    FROM staging.cafe_sales
),
analytics_count as (
    SELECT COUNT(*) AS total_analytics
    FROM analytics.cafe_orders
),
null_price as (
    SELECT COUNT(*) AS total_nulls
    FROM staging.cafe_sales
    WHERE price IS NULL
)
SELECT a.total_staging, b.total_analytics, c.total_nulls, (total_staging - total_analytics) as diff
FROM staging_count a
CROSS JOIN analytics_count b
CROSS JOIN null_price c;

--QUERY 2
SELECT string_agg(
    format(
        'ROUND(100.0 * COUNT(*) FILTER (WHERE %I IS NULL) / COUNT(*), 2) AS %I_null_pct',
        column_name,
        column_name
    ),
    E',\n'
)
FROM information_schema.columns
WHERE table_schema = 'staging'
  AND table_name = 'cafe_sales'; --Это мне чатГПТ подсказал. Очень удобная штука

SELECT COUNT(*) AS total_rows,
    ROUND(100.0 * COUNT(*) FILTER (WHERE order_id IS NULL) / COUNT(*), 2) AS order_id_null_pct,
    ROUND(100.0 * COUNT(*) FILTER (WHERE order_date IS NULL) / COUNT(*), 2) AS order_date_null_pct,
    ROUND(100.0 * COUNT(*) FILTER (WHERE customer_name IS NULL) / COUNT(*), 2) AS customer_name_null_pct,
    ROUND(100.0 * COUNT(*) FILTER (WHERE drink IS NULL) / COUNT(*), 2) AS drink_null_pct,
    ROUND(100.0 * COUNT(*) FILTER (WHERE size IS NULL) / COUNT(*), 2) AS size_null_pct,
    ROUND(100.0 * COUNT(*) FILTER (WHERE price IS NULL) / COUNT(*), 2) AS price_null_pct,
    ROUND(100.0 * COUNT(*) FILTER (WHERE branch IS NULL) / COUNT(*), 2) AS branch_null_pct,
    ROUND(100.0 * COUNT(*) FILTER (WHERE payment_method IS NULL) / COUNT(*), 2) AS payment_method_null_pct
FROM staging.cafe_sales

--QUERY 3

SELECT order_id, COUNT(order_id) AS order_count
FROM staging.cafe_sales
GROUP BY order_id
HAVING COUNT(order_id) > 1

--QUERY 4
SELECT order_id, price, order_date
FROM staging.cafe_sales
WHERE CAST(price AS NUMERIC) <= 0
    OR CAST(order_date AS DATE) < '2024-01-01'
    OR CAST(order_date AS DATE) > '2024-12-31'

--QUERY 5

WITH staging as (
    SELECT MAX(loaded_at) AS staging_last_load
    FROM staging.cafe_sales
),
analytics as (
    SELECT MAX(loaded_at) AS analytics_last_load
    FROM analytics.cafe_orders
)
SELECT staging_last_load, analytics_last_load
FROM staging a
CROSS JOIN analytics b;