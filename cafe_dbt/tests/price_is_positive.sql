SELECT price
FROM {{ref('fct_orders')}}
WHERE price <= 0