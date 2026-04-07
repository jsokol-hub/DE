SELECT DISTINCT LOWER(drink) as drink
FROM {{source('staging', 'cafe_sales')}}
WHERE drink IS NOT NULL