{% macro create_values_using_default_columns(default_columns, types, values) %}
    {% for index in range(default_columns | length) %}
        {{ dbt_testing.create_column_value_with_type(values[index], types[index], default_columns[index]) }}
        {% if not loop.last %},{% endif %}
    {% endfor %}
{% endmacro %}