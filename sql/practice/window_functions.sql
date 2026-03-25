--QUERY 1

WITH t1 as(
    SELECT order_id, CAST(order_date AS DATE) AS order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
),
t2 as (
    SELECT branch, drink, COUNT(order_id) AS orders_by_branch,
	ROW_NUMBER() OVER (
        PARTITION BY branch
        ORDER BY COUNT(order_id) DESC
    ) AS rn
    FROM t1
    GROUP BY drink, branch
)
SELECT branch, drink, orders_by_branch
FROM t2
WHERE rn <= 2
ORDER BY branch;

--QUERY 2

WITH t1 as(
    SELECT order_id, CAST(order_date AS DATE) AS order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
),
t2 as (
    SELECT customer_name, order_date, drink,
	ROW_NUMBER() OVER (
        PARTITION BY customer_name
        ORDER BY order_date DESC
    ) AS rn
    FROM t1
)
SELECT customer_name, drink, rn
FROM t2
WHERE rn = 1
ORDER BY customer_name;

--QUERY 3

WITH t1 as(
    SELECT order_id, CAST(order_date AS DATE) AS order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
),
t2 AS (
    SELECT drink, AVG(price) AS avg_price, 
	RANK() OVER(
		ORDER BY AVG(price)
	) AS rn
    FROM t1
    GROUP BY drink
)
SELECT drink, avg_price, rn
FROM t2
ORDER BY rn;

--QUERY 4

WITH t1 as(
    SELECT order_id, CAST(order_date AS DATE) AS order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
),
t2 AS (
    SELECT drink, AVG(price) AS avg_price, 
	DENSE_RANK() OVER(
		ORDER BY AVG(price)
	) AS rn
    FROM t1
    GROUP BY drink
)
SELECT drink, avg_price, rn
FROM t2
ORDER BY rn;

--ЧТО-ТО Я НЕ ПОНЯЛ В ЧЕМ РАЗНИЦА...
--ААА, ПОНЯЛ. DENSE_RANK ВОЗВРАЩАЕТ РАНГ БЕЗ ПРОПУСКОВ. Но у меня нет одинаковых значений и я не увидел. Возможно тут ошибка

--QUERY 5

WITH t1 as(
    SELECT order_id, CAST(order_date AS DATE) AS order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
)
SELECT branch, price,
    LAG(price) OVER (
        PARTITION BY branch
        ORDER BY order_id
    ) as previous_price
FROM t1;

--QUERY 6

WITH t1 as(
    SELECT order_id, CAST(order_date AS DATE) AS order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
)
SELECT customer_name, price,
    LEAD(price) OVER (
        PARTITION BY customer_name
        ORDER BY order_id
    ) as next_price
FROM t1;
--В у последнего заказа будет NULL конечно-же.

--QUERY 7

WITH t1 as(
    SELECT order_id, CAST(order_date AS DATE) AS order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
)
SELECT branch, price,
    SUM(price) OVER (
        PARTITION BY branch
        ORDER BY order_id
    ) as cumulative_summ
FROM t1;

--QUERY 8

WITH t1 as(
    SELECT order_id, CAST(order_date AS DATE) AS order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
)
SELECT branch, price,
    AVG(price) OVER (
        PARTITION BY branch
    ) as avg_price
FROM t1;

--QUERY 9

WITH t1 as(
    SELECT order_id, CAST(order_date AS DATE) AS order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
)
SELECT order_id, customer_name, price,
    COUNT(order_id) OVER (
        PARTITION BY customer_name
    ) as total_orders
FROM t1
ORDER BY order_id;

--QUERY 10

WITH t1 as(
    SELECT order_id, CAST(order_date AS DATE) AS order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
)
SELECT order_id, price,
    NTILE(4) OVER (
        ORDER BY price
    ) as quartile
FROM t1
ORDER BY order_id;