SELECT DISTINCT customer_name
FROM {{source('staging', 'cafe_sales')}}
WHERE customer_name IS NOT NULL