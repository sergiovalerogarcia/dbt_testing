{% macro create_values_using_columns_and_defaults(default_columns, types, values, columns) %}
    {%- for index in range(default_columns | length) -%}
        {%- if default_columns[index] in columns -%}
            {%- for index_of_column in range(columns | length) -%}
                {%- if default_columns[index] == columns[index_of_column] -%}
                    {{ dbt_testing.create_column_value_with_type(values[index_of_column], types[index], columns[index_of_column]) }}
                {%- endif %}
            {%- endfor %}
        {%- else -%}
            {{ dbt_testing.create_column_value_with_type(None, types[index], default_columns[index]) }}
        {%- endif %}
        {% if not loop.last %},{% endif %}
    {%- endfor -%}
{% endmacro %}