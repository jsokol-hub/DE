SELECT branch,
    {{dbt_utils.generate_surrogate_key(['branch'])}} AS branch_id
FROM {{ref('stg_branches')}}