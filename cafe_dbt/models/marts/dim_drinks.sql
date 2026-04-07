SELECT drink,
    {{dbt_utils.generate_surrogate_key(['drink'])}} AS drink_id
FROM {{ref('stg_drinks')}}