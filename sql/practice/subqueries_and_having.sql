--QUERY 1

WITH t1 as(
    SELECT order_id, CAST(order_date AS DATE) AS order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
)
SELECT branch, COUNT(order_id) AS total_orders
FROM t1
GROUP BY branch
HAVING COUNT(order_id) > 10;

--QUERY 2

WITH t1 as(
    SELECT order_id, CAST(order_date AS DATE) AS order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
)
SELECT branch, COUNT(order_id) AS total_orders
FROM t1
WHERE branch = 'central'
GROUP BY branch;

--QUERY 3

WITH t1 as(
    SELECT order_id, CAST(order_date AS DATE) AS order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
)
SELECT customer_name, price
FROM t1
WHERE price > (
    SELECT AVG(price)
    FROM t1
);

--QUERY 4

SELECT customer_name, summ
FROM (
    SELECT SUM(CAST(price AS NUMERIC)) as summ, customer_name
	FROM staging.cafe_sales
    WHERE price IS NOT NULL
	GROUP BY customer_name
) t
WHERE summ > 20;

--QUERY 5

WITH t1 as(
    SELECT order_id, CAST(order_date AS DATE) AS order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
)
SELECT DISTINCT outer_t.branch
FROM t1 as outer_t
WHERE EXISTS (
    SELECT 1
    FROM t1 as inner_t
    WHERE inner_t.branch = outer_t.branch
    AND inner_t.drink = 'latte'
);