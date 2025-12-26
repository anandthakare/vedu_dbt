-- macros/get_season.sql

{% macro get_season(timestamp_column) %}
    CASE 
        WHEN MONTH(TO_TIMESTAMP({{ timestamp_column }})) IN (12, 1, 2) THEN 'WINTER'
        WHEN MONTH(TO_TIMESTAMP({{ timestamp_column }})) IN (3, 4, 5) THEN 'SPRING'
        WHEN MONTH(TO_TIMESTAMP({{ timestamp_column }})) IN (6, 7, 8) THEN 'SUMMER'
        ELSE 'AUTUMN'
    END
{% endmacro %}

{% macro day_type(x) %}
    CASE 
        WHEN DAYNAME(TO_TIMESTAMP({{x}})) in ('Sat','Sun')
        THEN 'WEEKEND'
        ELSE 'BUSINESSDAY'    
    END
{%endmacro%}

