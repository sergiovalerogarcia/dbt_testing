{% macro column_not_found_in_defaults_columns(default_columns, columns) %}
    {% set columns_not_found = [] %}

    {% for column in columns %}
        {% if not(column in default_columns) %}
            {% do columns_not_found.append(column) %}
        {% endif %}
    {% endfor %} #}

    {% do return(
        ( columns_not_found | length ) > 0
    ) %}
{% endmacro %}