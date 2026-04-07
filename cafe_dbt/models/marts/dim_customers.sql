SELECT customer_name,
    {{dbt_utils.generate_surrogate_key(['customer_name'])}} AS customer_id
FROM {{ref('stg_customers')}}