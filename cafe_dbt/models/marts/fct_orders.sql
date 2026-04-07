SELECT order_id, 
        CAST(order_date AS DATE) AS order_date, 
        customer_name, 
        drink, 
        "size", 
        CAST(price AS NUMERIC) as price, 
        CASE 
            WHEN price < 4 THEN 'Low cost'
            WHEN price BETWEEN 4 AND 5 THEN 'Mid cost'
            WHEN price > 5 THEN 'High cost'
            ELSE 'Undefined'
        END as price_tier,
        branch, 
        payment_method
    FROM {{ref ('stg_cafe_orders')}}