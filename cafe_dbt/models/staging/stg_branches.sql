SELECT DISTINCT LOWER(branch) as branch
FROM {{source('staging', 'cafe_sales')}}
WHERE branch IS NOT NULL