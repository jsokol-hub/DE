SELECT order_id, CAST(order_date AS DATE) AS order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM {{source('staging', 'cafe_sales')}}
    WHERE price IS NOT NULL