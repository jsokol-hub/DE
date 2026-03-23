TRUNCATE TABLE analytics.cafe_orders;

WITH processing as(
    SELECT order_id, CAST(order_date AS DATE) as order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
),
analytics AS(
    SELECT order_id, 
        order_date, 
        customer_name, 
        drink, 
        "size", 
        price, 
        CASE 
            WHEN price < 4 THEN 'Low cost'
            WHEN price BETWEEN 4 AND 5 THEN 'Mid cost'
            WHEN price > 5 THEN 'High cost'
            ELSE 'Undefined'
        END as price_tier,
        branch, 
        payment_method
    FROM processing
)
INSERT INTO analytics.cafe_orders (order_id, 
    order_date, 
    customer_name, 
    drink,
    "size",
    price,
    price_tier,
    branch,
    payment_method
)
SELECT order_id, 
    order_date, 
    customer_name, 
    drink, 
    "size", 
    price, 
    price_tier,
    branch, 
    payment_method
FROM analytics;