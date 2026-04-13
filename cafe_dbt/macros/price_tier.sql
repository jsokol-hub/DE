{% macro price_tier(column_name) %}
    CASE 
        WHEN {{ column_name }} < 4 THEN 'Low cost'
        WHEN {{ column_name }} BETWEEN 4 AND 5 THEN 'Mid cost'
        WHEN {{ column_name }} > 5 THEN 'High cost'
        ELSE 'Undefined'
    END
{% endmacro %}