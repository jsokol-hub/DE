--QUERY 1

WITH processing1 as(
    SELECT order_id, order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
)
SELECT branch, SUM(price) as sum_price
FROM processing1
GROUP BY branch;

--QUERY 2

WITH processing2 as(
    SELECT order_id, order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
)
SELECT price,
    CASE 
        WHEN price < 4 THEN 'Low cost'
        WHEN price BETWEEN 4 AND 5 THEN 'Mid cost'
        WHEN price > 5 THEN 'High cost'
        ELSE 'Undefined'
    END as PriceCategory
FROM processing2;

--QUERY 3

WITH processing as(
    SELECT order_id, order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
)
SELECT SUM(price) AS sum_price,
    CASE 
        WHEN price < 4 THEN 'Low cost'
        WHEN price BETWEEN 4 AND 5 THEN 'Mid cost'
        WHEN price > 5 THEN 'High cost'
        ELSE 'Undefined'
    END as PriceCategory
FROM processing
GROUP BY PriceCategory;

--QUERY 4

WITH processing1 as(
    SELECT order_id, order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
	AND customer_name IS NOT NULL
)
SELECT customer_name, branch, SUM(price) AS sum_price,
    ROW_NUMBER() OVER (
        PARTITION BY branch
        ORDER BY SUM(price) DESC
    ) AS row_num
FROM processing1
GROUP BY customer_name, branch;

--QUERY 5

WITH processing1 as(
    SELECT order_id, CAST(order_date AS DATE) as order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
),
daily_sales as (
	SELECT SUM(price) AS daily_income, order_date
	FROM processing1
	GROUP BY order_date
)
SELECT order_date, daily_income,
    SUM(daily_income) OVER (
        ORDER BY order_date
    ) AS cumulative_income
FROM daily_sales;

--QUERY 6

WITH processing1 as(
    SELECT order_id, CAST(order_date AS DATE) as order_date, customer_name, drink, "size", CAST(price AS NUMERIC) as price, branch, payment_method
    FROM staging.cafe_sales
    WHERE price IS NOT NULL
),
daily_sales as (
	SELECT SUM(price) AS daily_income, order_date
	FROM processing1
	GROUP BY order_date
)
SELECT order_date, daily_income,
    (daily_income - (LAG(daily_income) OVER (ORDER BY order_date))) AS difference
FROM daily_sales;