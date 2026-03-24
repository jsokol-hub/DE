SELECT COUNT(order_id) as "Total ordered"
FROM staging.cafe_sales;

SELECT branch, COUNT(order_id) as "Total ordered per branch"
FROM staging.cafe_sales
GROUP BY branch;

SELECT drink, COUNT(drink) as "Drink count"
FROM staging.cafe_sales
GROUP BY drink
ORDER BY COUNT(drink) DESC
LIMIT 1;

SELECT AVG(CAST(price AS NUMERIC)) AS "Avg price", branch
FROM staging.cafe_sales
GROUP BY branch;

SELECT order_id, customer_name
FROM staging.cafe_sales
WHERE customer_name IS NULL;

SELECT order_date, SUM(CAST(price AS NUMERIC)) AS "Income"
FROM staging.cafe_sales
GROUP BY order_date;

SELECT customer_name, COUNT(order_id)
FROM staging.cafe_sales
GROUP BY customer_name
ORDER BY COUNT(order_id) DESC
LIMIT 3;