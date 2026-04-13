{{config(
    materialized='incremental',
    unique_key='order_id'
)}}

SELECT order_id, 
        CAST(order_date AS DATE) AS order_date, 
        customer_name, 
        drink, 
        "size", 
        CAST(price AS NUMERIC) as price, 
        {{ price_tier('price') }} as price_tier,
        branch, 
        payment_method
    FROM {{ref ('stg_cafe_orders')}}

{% if is_incremental() %}
    WHERE order_date > (SELECT MAX(order_date) FROM {{ this }})
{% endif %}